import 'package:client/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
class Like with _$Like {
  @JsonSerializable(explicitToJson: true)
  const factory Like({
    required String id,
    required User user,
    required DateTime createdAt,
  }) = _Like;

  factory Like.fromJson(Map<String, Object?> json) => _$LikeFromJson(json);
}
