import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_form_state.freezed.dart';

/// Stateを定義するクラス。
/// build_runnerのコマンド実行により、freezedのコードが生成される。
@freezed
class ProfileFormState with _$ProfileFormState {
  const factory ProfileFormState({
    required bool isLoading,
    required File? selectedImage,
  }) = _ProfileFormState;
}

/// Stateの初期値。
const ProfileFormState initialProfileFormState = ProfileFormState(
  isLoading: false,
  selectedImage: null,
);
