import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_form_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class RecipeFormState with _$RecipeFormState {
  const factory RecipeFormState({
    required bool isLoading,
  }) = _RecipeFormState;
}

/// Stateの初期値。
const RecipeFormState initialRecipeFormState = RecipeFormState(
  isLoading: false,
);
