import 'dart:io';

import 'package:client/models/models.dart';
import 'package:client/pages/profile_form/profile_form_state.dart';
import 'package:client/providers/signed_in_user_notifier.dart';
import 'package:client/services/cook_wild_service.dart';
import 'package:client/services/firebase_storage_service.dart';
import 'package:client/utis/cloud_storage_image_url_util.dart';
import 'package:client/utis/image_utils.dart';
import 'package:image_picker/image_picker.dart';
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

  void setSelectedImage({required File? selectedImage}) {
    state = state.copyWith(selectedImage: selectedImage);
  }

  Future<void> selectImage() async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      final selectedImage = await ImageUtil.pickImage(
        source: ImageSource.gallery,
      );
      setSelectedImage(selectedImage: selectedImage);
    } on Exception {
      // TODO: エラーの処理を追加する。
    } finally {
      setIsLoading(isLoading: false);
    }
  }

  Future<void> sendProfile({
    required User authenticatedUser,
    required String userName,
    required String userProfileDescription,
  }) async {
    if (state.isLoading) {
      return;
    }
    setIsLoading(isLoading: true);
    try {
      if (state.selectedImage != null) {
        await FirebaseStorageService.instance.put(
          state.selectedImage!,
          'users/${authenticatedUser.id}',
        );
      }
      final imageUrl = state.selectedImage == null
          ? null
          : CloudStorageImageUrlUtil.generateUserImageUrl(authenticatedUser.id);
      final updatedUser = await CookWildService.instance.updateUser(
        user: authenticatedUser,
        authenticatedUser: authenticatedUser,
        name: userName,
        profileDescription: userProfileDescription,
        imageUrl: imageUrl,
      );
      ref.read(signedInUserNotifierProvider.notifier).setSignedInUser(
            updatedUser,
          );
    } on Exception {
      // TODO: エラーの処理を追加する。
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
