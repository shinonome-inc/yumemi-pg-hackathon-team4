import 'package:client/models/recipe.dart';
import 'package:client/models/user.dart';
import 'package:client/pages/user/user_state.dart';
import 'package:client/services/cook_wild_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class UserNotifier extends _$UserNotifier {
  /// 初期状態を構築する。
  @override
  UserState build() {
    return initialUserState;
  }

  void setRecipes({required List<Recipe> recipes}) {
    state = state.copyWith(recipes: recipes);
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<void> fetchRecipesAndUsers() async {
    setIsLoading(isLoading: true);
    try {
      final recipes = await CookWildService.instance.getRecipes();
      setRecipes(recipes: recipes);
    } catch (e) {
      throw Exception(
        'レシピまたはユーザーの取得に失敗しました: $e',
      );
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
