import 'package:client/pages/top/top_state.dart';
import 'package:client/providers/signed_in_user_notifier.dart';
import 'package:client/services/auth_service.dart';
import 'package:client/services/cook_wild_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class TopNotifier extends _$TopNotifier {
  /// 初期状態を構築する。
  @override
  TopState build() {
    return initialTopState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setIsInitializeLoading({required bool isInitializeLoading}) {
    state = state.copyWith(isInitializeLoading: isInitializeLoading);
  }

  void setIsObscurePassword({required bool isObscurePassword}) {
    state = state.copyWith(isObscurePassword: isObscurePassword);
  }

  /// パスワードの表示・非表示の状態を切り替える。
  void toggleIsObscurePassword() {
    setIsObscurePassword(isObscurePassword: !state.isObscurePassword);
  }

  /// 初期化時にユーザーがログイン済みかどうか判定する。
  Future<bool> isUserSignedIn() async {
    final firebaseAuthenticatedUser = AuthService.instance.currentUser;
    final isSignedOutFirebase = firebaseAuthenticatedUser == null;
    if (isSignedOutFirebase) {
      setIsInitializeLoading(isInitializeLoading: false);
      return false;
    }
    final user = await CookWildService.instance.getUserById(
      firebaseAuthenticatedUser.uid,
    );
    if (user == null) {
      setIsInitializeLoading(isInitializeLoading: false);
      return false;
    }
    ref.read(signedInUserNotifierProvider.notifier).setSignedInUser(user);
    final signedInUser = ref.read(signedInUserNotifierProvider);
    final isUserSignedIn = signedInUser != null;
    setIsInitializeLoading(isInitializeLoading: false);
    return isUserSignedIn;
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    if (state.isLoading || email.isEmpty || password.isEmpty) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      await AuthService.instance.signInWithEmail(email, password);
    } catch (e) {
      throw Exception('Failed to sign in with email: $e');
    } finally {
      setIsLoading(isLoading: false);
    }
  }

  Future<void> signInWithGoogle() async {
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
