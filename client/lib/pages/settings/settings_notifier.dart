import 'package:client/pages/settings/settings_state.dart';
import 'package:client/providers/signed_in_user_notifier.dart';
import 'package:client/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  /// 初期状態を構築する。
  @override
  SettingsState build() {
    return initialSettingsState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  /// 認証中ユーザーのサインアウトを行う。
  ///
  /// Firebase Authenticationからログイン状態の破棄をする。
  /// また、アプリ内のログイン中ユーザーの情報も破棄する。
  ///
  Future<void> signOut() async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      await AuthService.instance.signOut();
      ref.read(signedInUserNotifierProvider.notifier).setSignedInUser(null);
    } on Exception {
      // TODO: エラーの処理を追加する。
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
