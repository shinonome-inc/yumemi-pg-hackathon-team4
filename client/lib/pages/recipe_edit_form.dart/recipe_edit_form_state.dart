import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_edit_form_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class RecipeEditFormState with _$RecipeEditFormState {
  const factory RecipeEditFormState({
    required bool isLoading,
  }) = _RecipeEditFormState;
}

/// Stateの初期値。
const RecipeEditFormState initialRecipeFormState = RecipeEditFormState(
  isLoading: false,
);
