import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_steps.freezed.dart';

@freezed
class CookingSteps with _$CookingSteps {
  const factory CookingSteps({
    required String id,
    String? imageUrl,
    required String description,
  }) = _CookingSteps;
}
