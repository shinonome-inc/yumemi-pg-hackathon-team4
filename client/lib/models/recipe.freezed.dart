// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get thumbnailImageUrls => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  List<Like> get likes => throw _privateConstructorUsedError;
  List<CookingSteps> get cookingSteps => throw _privateConstructorUsedError;
  List<GatheringSteps> get gatheringSteps => throw _privateConstructorUsedError;
  int get likesCounts => throw _privateConstructorUsedError;
  String get aiComment => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get tips => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String id,
      User user,
      String title,
      List<String> thumbnailImageUrls,
      List<Ingredient> ingredients,
      List<Like> likes,
      List<CookingSteps> cookingSteps,
      List<GatheringSteps> gatheringSteps,
      int likesCounts,
      String aiComment,
      String description,
      String tips,
      List<Comment> comments,
      DateTime createdAt,
      DateTime updatedAt});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? title = null,
    Object? thumbnailImageUrls = null,
    Object? ingredients = null,
    Object? likes = null,
    Object? cookingSteps = null,
    Object? gatheringSteps = null,
    Object? likesCounts = null,
    Object? aiComment = null,
    Object? description = null,
    Object? tips = null,
    Object? comments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageUrls: null == thumbnailImageUrls
          ? _value.thumbnailImageUrls
          : thumbnailImageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>,
      cookingSteps: null == cookingSteps
          ? _value.cookingSteps
          : cookingSteps // ignore: cast_nullable_to_non_nullable
              as List<CookingSteps>,
      gatheringSteps: null == gatheringSteps
          ? _value.gatheringSteps
          : gatheringSteps // ignore: cast_nullable_to_non_nullable
              as List<GatheringSteps>,
      likesCounts: null == likesCounts
          ? _value.likesCounts
          : likesCounts // ignore: cast_nullable_to_non_nullable
              as int,
      aiComment: null == aiComment
          ? _value.aiComment
          : aiComment // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      User user,
      String title,
      List<String> thumbnailImageUrls,
      List<Ingredient> ingredients,
      List<Like> likes,
      List<CookingSteps> cookingSteps,
      List<GatheringSteps> gatheringSteps,
      int likesCounts,
      String aiComment,
      String description,
      String tips,
      List<Comment> comments,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? title = null,
    Object? thumbnailImageUrls = null,
    Object? ingredients = null,
    Object? likes = null,
    Object? cookingSteps = null,
    Object? gatheringSteps = null,
    Object? likesCounts = null,
    Object? aiComment = null,
    Object? description = null,
    Object? tips = null,
    Object? comments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RecipeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageUrls: null == thumbnailImageUrls
          ? _value._thumbnailImageUrls
          : thumbnailImageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>,
      cookingSteps: null == cookingSteps
          ? _value._cookingSteps
          : cookingSteps // ignore: cast_nullable_to_non_nullable
              as List<CookingSteps>,
      gatheringSteps: null == gatheringSteps
          ? _value._gatheringSteps
          : gatheringSteps // ignore: cast_nullable_to_non_nullable
              as List<GatheringSteps>,
      likesCounts: null == likesCounts
          ? _value.likesCounts
          : likesCounts // ignore: cast_nullable_to_non_nullable
              as int,
      aiComment: null == aiComment
          ? _value.aiComment
          : aiComment // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {required this.id,
      required this.user,
      required this.title,
      required final List<String> thumbnailImageUrls,
      required final List<Ingredient> ingredients,
      required final List<Like> likes,
      required final List<CookingSteps> cookingSteps,
      required final List<GatheringSteps> gatheringSteps,
      required this.likesCounts,
      required this.aiComment,
      required this.description,
      required this.tips,
      required final List<Comment> comments,
      required this.createdAt,
      required this.updatedAt})
      : _thumbnailImageUrls = thumbnailImageUrls,
        _ingredients = ingredients,
        _likes = likes,
        _cookingSteps = cookingSteps,
        _gatheringSteps = gatheringSteps,
        _comments = comments;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final String id;
  @override
  final User user;
  @override
  final String title;
  final List<String> _thumbnailImageUrls;
  @override
  List<String> get thumbnailImageUrls {
    if (_thumbnailImageUrls is EqualUnmodifiableListView)
      return _thumbnailImageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnailImageUrls);
  }

  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<Like> _likes;
  @override
  List<Like> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  final List<CookingSteps> _cookingSteps;
  @override
  List<CookingSteps> get cookingSteps {
    if (_cookingSteps is EqualUnmodifiableListView) return _cookingSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cookingSteps);
  }

  final List<GatheringSteps> _gatheringSteps;
  @override
  List<GatheringSteps> get gatheringSteps {
    if (_gatheringSteps is EqualUnmodifiableListView) return _gatheringSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gatheringSteps);
  }

  @override
  final int likesCounts;
  @override
  final String aiComment;
  @override
  final String description;
  @override
  final String tips;
  final List<Comment> _comments;
  @override
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Recipe(id: $id, user: $user, title: $title, thumbnailImageUrls: $thumbnailImageUrls, ingredients: $ingredients, likes: $likes, cookingSteps: $cookingSteps, gatheringSteps: $gatheringSteps, likesCounts: $likesCounts, aiComment: $aiComment, description: $description, tips: $tips, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._thumbnailImageUrls, _thumbnailImageUrls) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality()
                .equals(other._cookingSteps, _cookingSteps) &&
            const DeepCollectionEquality()
                .equals(other._gatheringSteps, _gatheringSteps) &&
            (identical(other.likesCounts, likesCounts) ||
                other.likesCounts == likesCounts) &&
            (identical(other.aiComment, aiComment) ||
                other.aiComment == aiComment) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.tips, tips) || other.tips == tips) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      title,
      const DeepCollectionEquality().hash(_thumbnailImageUrls),
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_cookingSteps),
      const DeepCollectionEquality().hash(_gatheringSteps),
      likesCounts,
      aiComment,
      description,
      tips,
      const DeepCollectionEquality().hash(_comments),
      createdAt,
      updatedAt);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String id,
      required final User user,
      required final String title,
      required final List<String> thumbnailImageUrls,
      required final List<Ingredient> ingredients,
      required final List<Like> likes,
      required final List<CookingSteps> cookingSteps,
      required final List<GatheringSteps> gatheringSteps,
      required final int likesCounts,
      required final String aiComment,
      required final String description,
      required final String tips,
      required final List<Comment> comments,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  String get id;
  @override
  User get user;
  @override
  String get title;
  @override
  List<String> get thumbnailImageUrls;
  @override
  List<Ingredient> get ingredients;
  @override
  List<Like> get likes;
  @override
  List<CookingSteps> get cookingSteps;
  @override
  List<GatheringSteps> get gatheringSteps;
  @override
  int get likesCounts;
  @override
  String get aiComment;
  @override
  String get description;
  @override
  String get tips;
  @override
  List<Comment> get comments;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
