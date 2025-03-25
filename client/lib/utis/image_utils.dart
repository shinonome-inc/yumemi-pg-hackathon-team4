import 'dart:io';

import 'package:image_picker/image_picker.dart';

/// 画像に関連するユーティリティクラス。
class ImageUtil {
  ImageUtil._();

  static final _picker = ImagePicker();

  /// 画像の取得する。
  static Future<File?> pickCroppedImage({required ImageSource source}) async {
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage == null) {
      return null;
    }
    final image = File(pickedImage.path);
    return image;
  }
}
