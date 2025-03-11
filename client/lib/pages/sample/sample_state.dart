import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class SampleState with _$SampleState {
  const factory SampleState({
    required bool isLoading,
  }) = _SampleState;
}

/// Stateの初期値。
const SampleState initialSampleState = SampleState(
  isLoading: false,
);
