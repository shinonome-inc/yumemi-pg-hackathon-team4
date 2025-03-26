import 'package:client/utis/date_time_util.dart';

/// CloudStorageの画像関連のユーティリティクラス。
class CloudStorageImageUrlUtil {
  CloudStorageImageUrlUtil._();

  static const String _baseUrl =
      'https://firebasestorage.googleapis.com/v0/b/terraform-gcp-learning-yo2.firebasestorage.app/o';
  static final String _queryParams = 'alt=media&v=${DateTimeUtil.timeStamp}';

  /// ユーザーIDを基にユーザーアイコンの画像アドレスを生成する。
  static String generateUserImageUrl(String userId) {
    return '$_baseUrl/users%2F$userId?$_queryParams';
  }
}
