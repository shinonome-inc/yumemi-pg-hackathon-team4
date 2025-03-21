import 'package:client/pages/sign_in/sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class SignInNotifier extends _$SignInNotifier {
  /// 初期状態を構築する。
  @override
  SignInState build() {
    return initialSignInState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }
}
