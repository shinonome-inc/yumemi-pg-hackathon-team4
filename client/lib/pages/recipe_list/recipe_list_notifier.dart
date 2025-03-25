import 'package:client/models/recipe.dart';
import 'package:client/pages/recipe_list/recipe_list_state.dart';
import 'package:client/services/cook_wild_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recipe_list_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class RecipeListNotifier extends _$RecipeListNotifier {
  /// 初期状態を構築する。
  @override
  RecipeListState build() {
    return initialRecipeListState;
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
      throw Exception('Failed to fetch recipes or users: $e');
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
