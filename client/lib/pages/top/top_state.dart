import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class TopState with _$TopState {
  const factory TopState({
    required bool isLoading,
    required bool isObscurePassword,
  }) = _TopState;
}

/// Stateの初期値。
const TopState initialTopState = TopState(
  isLoading: false,
  isObscurePassword: true,
);
