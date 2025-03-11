import 'package:client/pages/current_user/current_user_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class CurrentUserNotifier extends _$CurrentUserNotifier {
  /// 初期状態を構築する。
  @override
  CurrentUserState build() {
    return initialCurrentUserState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }
}
