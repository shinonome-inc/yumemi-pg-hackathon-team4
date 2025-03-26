import 'dart:io';

import 'package:client/components/recipe_form_view.dart';
import 'package:client/models/models.dart';
import 'package:client/pages/recipe_form/recipe_form_state.dart';
import 'package:client/providers/signed_in_user_notifier.dart';
import 'package:client/services/cook_wild_service.dart';
import 'package:client/services/firebase_storage_service.dart';
import 'package:client/services/gemini_service.dart';
import 'package:client/utils/image_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'recipe_form_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class RecipeFormNotifier extends _$RecipeFormNotifier {
  /// 初期状態を構築する。
  @override
  RecipeFormState build() {
    return initialRecipeFormState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setSelectedImage({required File? selectedImage}) {
    state = state.copyWith(selectedImage: selectedImage);
  }

  static const _uuid = Uuid();
  final _now = DateTime.now();

  /// UUIDを生成します。
  String _generateUuid() => _uuid.v4();

  Future<void> selectImage({required ImageSource source}) async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      final pickedImage = await ImageUtil.pickImage(
        source: source,
      );
      setSelectedImage(selectedImage: pickedImage);
    } on Exception {
      // TODO: エラーの処理を追加する。
    } finally {
      setIsLoading(isLoading: false);
    }
  }

  Future<void> uploadImage() async {
    if (state.isLoading || state.selectedImage == null) {
      return;
    }
    final storagePath = 'recipes/${_generateUuid()}';
    try {
      await FirebaseStorageService.instance
          .put(state.selectedImage!, storagePath);
    } on Exception {
      // エラー処理を追加
      return;
    } finally {
      setIsLoading(isLoading: false);
    }
  }

  void clearImage() {
    setSelectedImage(selectedImage: null);
  }

  Future<void> submitRecipe({
    required String title,
    required String description,
    required List<Map<String, String>> ingredients,
    required List<RecipeStep> gatheringSteps,
    required List<RecipeStep> cookingSteps,
    required String tips,
    required String? imageUrl,
  }) async {
    setIsLoading(isLoading: true);
    try {
      final ingredientList = ingredients
          .asMap()
          .entries
          .map(
            (entry) => Ingredient(
              id: '${entry.key}',
              ingredientName: entry.value['ingredientName']!,
              quantity: entry.value['quantity']!,
            ),
          )
          .toList();

      final gatheringStepList = await Future.wait(
        gatheringSteps
            .asMap()
            .entries
            .map<Future<GatheringSteps>>((entry) async {
          final index = entry.key;
          final step = entry.value;
          return GatheringSteps(
            id: '$index',
            description: step.description,
            imageUrl: null,
          );
        }).toList(),
      );

      final cookingStepList = await Future.wait(
        cookingSteps.asMap().entries.map<Future<CookingSteps>>((entry) async {
          final index = entry.key;
          final step = entry.value;
          return CookingSteps(
            id: '$index',
            description: step.description,
            imageUrl: null,
          );
        }).toList(),
      );

      final signedInUser = ref.read(signedInUserNotifierProvider);
      if (signedInUser == null) {
        // TODO: サインイン中のユーザーが存在しない場合の処理を追加する。
        return;
      }

      final recipe = Recipe(
        id: _generateUuid(),
        title: title,
        description: description,
        ingredients: ingredientList,
        gatheringSteps: gatheringStepList,
        cookingSteps: cookingStepList,
        tips: tips,
        thumbnailImageUrls: [imageUrl ?? ''],
        createdAt: _now,
        updatedAt: _now,
        user: signedInUser,
        likes: [],
        likesCounts: 0,
        comments: [],
        aiComment: '',
      );
      final aiComment = await GeminiService.instance.generateMessage(
        inputText: recipe.toJson().toString(),
      );

      await CookWildService.instance.postRecipe(
        recipe.copyWith(aiComment: aiComment),
      );
    } catch (e) {
      // エラー処理
      throw Exception(
        'レシピの投稿に失敗しました: $e',
      );
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
