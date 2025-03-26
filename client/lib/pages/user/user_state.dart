import 'package:client/models/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class UserState with _$UserState {
  const factory UserState({
    required bool isLoading,
    required List<Recipe> recipes,
  }) = _UserState;
}

/// Stateの初期値。
const UserState initialUserState = UserState(isLoading: false, recipes: []);
