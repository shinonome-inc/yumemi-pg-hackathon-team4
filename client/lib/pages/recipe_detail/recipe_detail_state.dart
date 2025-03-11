import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class RecipeDetailState with _$RecipeDetailState {
  const factory RecipeDetailState({
    required bool isLoading,
  }) = _RecipeDetailState;
}

/// Stateの初期値。
const RecipeDetailState initialRecipeDetailState = RecipeDetailState(
  isLoading: false,
);
