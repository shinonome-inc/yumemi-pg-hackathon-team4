import 'package:client/pages/recipe_form/recipe_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_edit_form_notifier.g.dart';

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
}
