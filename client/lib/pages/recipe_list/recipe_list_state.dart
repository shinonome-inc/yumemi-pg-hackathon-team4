import 'package:client/models/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_list_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class RecipeListState with _$RecipeListState {
  const factory RecipeListState({
    required bool isLoading,
    required List<Recipe> recipes,
  }) = _RecipeListState;
}

/// Stateの初期値。
const RecipeListState initialRecipeListState = RecipeListState(
  isLoading: false,
  recipes: [],
);
