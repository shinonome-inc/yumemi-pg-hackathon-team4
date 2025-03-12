import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_steps.freezed.dart';
part 'cooking_steps.g.dart';

@freezed
class CookingSteps with _$CookingSteps {
  @JsonSerializable(explicitToJson: true)
  const factory CookingSteps({
    required String id,
    required String? imageUrl,
    required String description,
  }) = _CookingSteps;

  factory CookingSteps.fromJson(Map<String, Object?> json) =>
      _$CookingStepsFromJson(json);
}
