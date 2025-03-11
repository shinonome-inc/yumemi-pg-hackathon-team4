import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required bool isLoading,
  }) = _SignUpState;
}

/// Stateの初期値。
const SignUpState initialSignUpState = SignUpState(
  isLoading: false,
);
