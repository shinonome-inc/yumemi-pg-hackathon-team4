// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: json['id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      thumbnailImageUrls: (json['thumbnailImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: (json['likes'] as List<dynamic>)
          .map((e) => Like.fromJson(e as Map<String, dynamic>))
          .toList(),
      cookingSteps: (json['cookingSteps'] as List<dynamic>)
          .map((e) => CookingSteps.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatheringSteps: (json['gatheringSteps'] as List<dynamic>)
          .map((e) => GatheringSteps.fromJson(e as Map<String, dynamic>))
          .toList(),
      likesCounts: (json['likesCounts'] as num).toInt(),
      aiComment: json['aiComment'] as String,
      description: json['description'] as String,
      tips: json['tips'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'title': instance.title,
      'thumbnailImageUrls': instance.thumbnailImageUrls,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'likes': instance.likes.map((e) => e.toJson()).toList(),
      'cookingSteps': instance.cookingSteps.map((e) => e.toJson()).toList(),
      'gatheringSteps': instance.gatheringSteps.map((e) => e.toJson()).toList(),
      'likesCounts': instance.likesCounts,
      'aiComment': instance.aiComment,
      'description': instance.description,
      'tips': instance.tips,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
