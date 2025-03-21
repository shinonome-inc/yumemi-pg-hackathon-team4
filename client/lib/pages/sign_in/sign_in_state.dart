import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required bool isLoading,
  }) = _SignInState;
}

/// Stateの初期値。
const SignInState initialSignInState = SignInState(
  isLoading: false,
);
