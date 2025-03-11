import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool isLoading,
  }) = _SettingsState;
}

/// Stateの初期値。
const SettingsState initialSettingsState = SettingsState(
  isLoading: false,
);
