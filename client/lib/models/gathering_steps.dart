import 'package:freezed_annotation/freezed_annotation.dart';

part 'gathering_steps.freezed.dart';

@freezed
class GatheringSteps with _$GatheringSteps {
  const factory GatheringSteps({
    required String id,
    String? imageUrl,
    required String description,
  }) = _GatheringSteps;
}
