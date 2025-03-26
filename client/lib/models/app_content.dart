import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_content.freezed.dart';
part 'app_content.g.dart';

@freezed
class AppContent with _$AppContent {
  @JsonSerializable(explicitToJson: true)
  const factory AppContent({
    required String text,
  }) = _AppContent;

  factory AppContent.fromJson(Map<String, Object?> json) =>
      _$AppContentFromJson(json);
}
