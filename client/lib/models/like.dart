import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';

@freezed
class Like with _$Like {
  const factory Like({
    required String id,
    required String user,
    required DateTime createdAt,
  }) = _Like;
}
