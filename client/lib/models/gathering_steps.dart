import 'package:freezed_annotation/freezed_annotation.dart';

part 'gathering_steps.freezed.dart';
part 'gathering_steps.g.dart';

@freezed
class GatheringSteps with _$GatheringSteps {
  const factory GatheringSteps({
    required String id,
    required String? imageUrl,
    required String description,
  }) = _GatheringSteps;

  factory GatheringSteps.fromJson(Map<String, Object?> json) =>
      _$GatheringStepsFromJson(json);
}
