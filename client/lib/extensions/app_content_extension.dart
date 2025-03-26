import 'package:client/models/app_content.dart';

/// AppContentのExtension。
extension AppContentExtension on AppContent {
  /// 表示用のテキスト。
  ///
  /// 改行記号のテキストを実際の改行に置き換える。
  ///
  String get displayText => text.replaceAll(r'\n', '\n');
}
