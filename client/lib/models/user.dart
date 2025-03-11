import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String imageUrl,
    required String profileDescription,
    required DateTime createdAt,
    required List<String> recipes,
  }) = _User;
}
