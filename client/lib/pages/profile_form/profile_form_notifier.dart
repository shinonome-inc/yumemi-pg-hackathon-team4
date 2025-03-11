import 'package:client/pages/profile_form/profile_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_form_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class ProfileFormNotifier extends _$ProfileFormNotifier {
  /// 初期状態を構築する。
  @override
  ProfileFormState build() {
    return initialProfileFormState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }
}
