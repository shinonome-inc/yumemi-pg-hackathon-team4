import 'package:client/pages/sample/sample_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class SampleNotifier extends _$SampleNotifier {
  /// 初期状態を構築する。
  @override
  SampleState build() {
    return initialSampleState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }
}
