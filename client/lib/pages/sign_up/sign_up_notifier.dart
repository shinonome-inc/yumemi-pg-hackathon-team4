import 'package:client/pages/sign_up/sign_up_state.dart';
import 'package:client/providers/signed_in_user_notifier.dart';
import 'package:client/services/auth_service.dart';
import 'package:client/services/cook_wild_service.dart';
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

  /// パスワードの表示・非表示の状態を切り替える。
  void toggleIsObscurePassword() {
    setIsObscurePassword(isObscurePassword: !state.isObscurePassword);
  }

  Future<void> signUpWithEmail({
    required String userName,
    required String email,
    required String password,
  }) async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      final credential = await AuthService.instance.signUpWithEmail(
        email,
        password,
      );
      final user = await CookWildService.instance.postUser(
        credential: credential,
        userName: userName,
      );
      ref.read(signedInUserNotifierProvider.notifier).setSignedInUser(user);
    } catch (e) {
      // TODO: エラーの処理を追加する。
      throw Exception('Failed to sign up with email: $e');
    } finally {
      setIsLoading(isLoading: false);
    }
  }

  Future<void> signUpWithGoogle({
    required String userName,
  }) async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      final credential = await AuthService.instance.signInWithGoogle();
      final user = await CookWildService.instance.postUser(
        credential: credential,
        userName: userName,
      );
      ref.read(signedInUserNotifierProvider.notifier).setSignedInUser(user);
    } on Exception {
      // TODO: エラーの処理を追加する。
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
