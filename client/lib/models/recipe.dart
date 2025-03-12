import 'package:client/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String user,
    required String title,
    required List<String> thumbnailImageUrls,
    required List<Ingredient> ingredients,
    required List<Like> likes,
    required List<CookingSteps> cookingSteps,
    required List<GatheringSteps> gatheringSteps,
    required int likesCounts,
    required String aiComment,
    required String description,
    required String tips,
    required List<Comment> comments,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
