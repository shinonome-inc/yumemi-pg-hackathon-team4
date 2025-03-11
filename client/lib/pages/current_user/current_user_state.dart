import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class CurrentUserState with _$CurrentUserState {
  const factory CurrentUserState({
    required bool isLoading,
  }) = _CurrentUserState;
}

/// Stateの初期値。
const CurrentUserState initialCurrentUserState = CurrentUserState(
  isLoading: false,
);
