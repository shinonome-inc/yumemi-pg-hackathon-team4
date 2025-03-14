import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    required String id,
    required String name,
    required String imageUrl,
    required String profileDescription,
    required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
