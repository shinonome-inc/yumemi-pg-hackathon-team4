import 'package:client/pages/top/top_state.dart';
import 'package:client/services/auth_service.dart';
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

  void setIsObscurePassword({required bool isObscurePassword}) {
    state = state.copyWith(isObscurePassword: isObscurePassword);
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      await AuthService.instance.signInWithEmail(email, password);
    } on Exception {
      // TODO: エラーの処理を追加する。
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
