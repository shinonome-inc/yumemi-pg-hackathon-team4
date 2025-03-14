import 'package:client/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(explicitToJson: true)
  const factory Comment({
    required String id,
    required User user,
    required String contentText,
    required String? imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}
