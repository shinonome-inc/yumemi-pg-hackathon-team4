import 'package:client/pages/sign_up/sign_up_state.dart';
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
}
