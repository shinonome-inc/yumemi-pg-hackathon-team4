import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String user,
    required String title,
    required List<String> thumbnailImageUrls,
    required List<String> ingredients,
    required List<String> likes,
    required List<String> cookingSteps,
    required List<String> gatheringSteps,
    required int likesCounts,
    required String aiComment,
    required String description,
    required String tips,
    required List<String> comments,
  }) = _Recipe;
}
