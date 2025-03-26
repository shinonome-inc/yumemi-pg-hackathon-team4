import 'package:client/models/recipe.dart';
import 'package:client/models/user.dart';
import 'package:client/pages/recipe_detail/recipe_detail_state.dart';
import 'package:client/services/cook_wild_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_detail_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class RecipeDetailNotifier extends _$RecipeDetailNotifier {
  /// 初期状態を構築する。
  @override
  RecipeDetailState build() {
    return initialRecipeDetailState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<void> addLikeRecipe(Recipe recipe, User user) async {
    await CookWildService.instance.likeRecipe(recipe, user);
  }

  Future<void> removeLikeRecipe(Recipe recipe, User user) async {
    await CookWildService.instance.undoLikeRecipe(recipe, user);
  }

  Future<void> sendComment(
    Recipe recipe,
    User user,
    String contentText,
    String? imageUrl,
  ) async {
    setIsLoading(isLoading: true);
    await CookWildService.instance.postComment(
      recipe: recipe,
      authenticatedUser: user,
      contentText: contentText,
      imageUrl: imageUrl!,
    );
  }
}
