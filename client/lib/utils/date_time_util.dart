/// DateTimeに関するユーティリティクラス。
class DateTimeUtil {
  DateTimeUtil._();

  /// タイムスタンプを取得する。
  static String get timeStamp =>
      DateTime.now().millisecondsSinceEpoch.toString();
}
