import 'package:client/pages/sign_up/sign_up_state.dart';
import 'package:client/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  /// 初期状態を構築する。
  @override
  SignUpState build() {
    return initialSignUpState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setIsObscurePassword({required bool isObscurePassword}) {
    state = state.copyWith(isObscurePassword: isObscurePassword);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      await AuthService.instance.signUpWithEmail(email, password);
    } on Exception {
      // TODO: エラーの処理を追加する。
    } finally {
      setIsLoading(isLoading: false);
    }
  }

  Future<void> signUpWithGoogle() async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      await AuthService.instance.signInWithGoogle();
    } on Exception {
      // TODO: エラーの処理を追加する。
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
