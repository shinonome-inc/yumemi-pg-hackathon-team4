import 'package:client/models/models.dart';
import 'package:client/repository/firestore_repository.dart';
import 'package:uuid/uuid.dart';

/// CookWild のバックエンドとのデータ操作を行うクラス。
///
/// シングルトンパターンを採用しており、`CookWildService.instance` で利用できます。
class CookWildService {
  CookWildService._();
  static final CookWildService instance = CookWildService._();

  final _repository = FirestoreRepository.instance;

  static const _uuid = Uuid();
  final _now = DateTime.now();

  /// UUIDを生成します。
  String _generateUuid() => _uuid.v4();

  /// コメントを投稿します。
  ///
  /// [recipe] にはコメントを投稿するレシピを指定します。
  /// [authenticatedUser] にはコメントを投稿するユーザーを指定します。
  /// [contentText] にはコメントの本文を指定します。
  /// [imageUrl] にはコメントの画像URLを指定します。
  ///
  /// [contentText] または [imageUrl] が空の場合、ArgumentErrorをスローします。
  ///
  Future<void> postComment({
    required Recipe recipe,
    required User authenticatedUser,
    String contentText = '',
    String imageUrl = '',
  }) async {
    if (contentText.isEmpty && imageUrl.isEmpty) {
      throw ArgumentError('contentText and imageUrl are both empty');
    }
    final createdComment = Comment(
      id: _generateUuid(),
      user: authenticatedUser,
      contentText: contentText,
      imageUrl: imageUrl,
      createdAt: _now,
      updatedAt: _now,
    );
    final updatedComments = List.of(recipe.comments)..add(createdComment);
    final updatedRecipe = recipe.copyWith(comments: updatedComments);
    try {
      await _repository.updateRecipe(updatedRecipe);
    } catch (e) {
      throw Exception('Failed to post comment: $e');
    }
  }

  /// コメント一覧を取得します。
  Future<List<Comment>> getComments() async {
    try {
      return await _repository.getComments();
    } catch (e) {
      throw Exception('Failed to get comments: $e');
    }
  }

  /// 指定したコメントIDのコメントを取得します。
  Future<Comment> getCommentById(String commentId) async {
    try {
      return await _repository.getCommentById(commentId);
    } catch (e) {
      throw Exception('Failed to get comment: $e');
    }
  }

  /// コメントを更新します。
  ///
  /// [recipe] には更新対象のレシピを指定します。
  /// [authenticatedUser] には更新を行うユーザーを指定します。
  /// [comment] には更新対象のコメントを指定します。
  /// [contentText] には更新後のコメントの本文を指定します。
  /// [imageUrl] には更新後のコメントの画像URLを指定します。
  ///
  /// [contentText] または [imageUrl] が指定されていない場合、元の値を使用します。
  ///
  /// [comment] のユーザーが [authenticatedUser] と一致しない場合、
  /// ArgumentErrorをスローします。
  ///
  Future<void> updateComment({
    required Recipe recipe,
    required User authenticatedUser,
    required Comment comment,
    String? contentText,
    String? imageUrl,
  }) async {
    if (comment.user.id != authenticatedUser.id) {
      throw ArgumentError('Comment user does not match authenticated user');
    }
    if (contentText == null && imageUrl == null) {
      return;
    }
    final updatedComment = comment.copyWith(
      contentText: contentText ?? comment.contentText,
      imageUrl: imageUrl ?? comment.imageUrl,
      updatedAt: _now,
    );
    try {
      final updatedComments = List.of(recipe.comments)
        ..removeWhere((c) => c.id == comment.id)
        ..add(updatedComment);
      final updatedRecipe = recipe.copyWith(comments: updatedComments);
      await _repository.updateRecipe(updatedRecipe);
    } catch (e) {
      throw Exception('Failed to post comment: $e');
    }
  }

  /// 調理手順一覧を取得します。
  Future<List<CookingSteps>> getCookingSteps() async {
    try {
      return await _repository.getCookingSteps();
    } catch (e) {
      throw Exception('Failed to get cooking steps: $e');
    }
  }

  /// 指定した調理手順IDの調理手順を取得します。
  Future<CookingSteps> getCookingStepsById(String cookingStepsId) async {
    try {
      return await _repository.getCookingStepsById(cookingStepsId);
    } catch (e) {
      throw Exception('Failed to get cooking step: $e');
    }
  }

  /// 採取方法一覧を取得します。
  Future<List<GatheringSteps>> getGatheringSteps() async {
    try {
      return await _repository.getGatheringSteps();
    } catch (e) {
      throw Exception('Failed to get gathering steps: $e');
    }
  }

  /// 指定した採取方法IDの採取方法を取得します。
  Future<GatheringSteps> getGatheringStepsById(String gatheringStepsId) async {
    try {
      return await _repository.getGatheringStepsById(gatheringStepsId);
    } catch (e) {
      throw Exception('Failed to get gathering step: $e');
    }
  }

  /// 食材一覧を取得します。
  Future<List<Ingredient>> getIngredients() async {
    try {
      return await _repository.getIngredients();
    } catch (e) {
      throw Exception('Failed to get ingredients: $e');
    }
  }

  /// 指定した食材IDの食材を取得します。
  Future<Ingredient> getIngredientById(String ingredientId) async {
    try {
      return await _repository.getIngredientById(ingredientId);
    } catch (e) {
      throw Exception('Failed to get ingredient: $e');
    }
  }

  /// いいね一覧を取得します。
  Future<List<Like>> getLikes() async {
    try {
      return await _repository.getLikes();
    } catch (e) {
      throw Exception('Failed to get likes: $e');
    }
  }

  /// 指定したいいねIDのいいねを取得します。
  Future<Like> getLikeById(String likeId) async {
    try {
      return await _repository.getLikeById(likeId);
    } catch (e) {
      throw Exception('Failed to get like: $e');
    }
  }

  /// レシピを投稿します。
  Future<void> postRecipe(Recipe recipe) async {
    try {
      await _repository.setRecipe(recipe);
    } catch (e) {
      throw Exception('Failed to post recipe: $e');
    }
  }

  /// レシピ一覧を取得します。
  Future<List<Recipe>> getRecipes() async {
    try {
      return await _repository.getRecipes();
    } catch (e) {
      throw Exception('Failed to get recipes: $e');
    }
  }

  /// 指定したレシピIDのレシピを取得します。
  Future<Recipe> getRecipeById(String recipeId) async {
    try {
      return await _repository.getRecipeById(recipeId);
    } catch (e) {
      throw Exception('Failed to get recipe: $e');
    }
  }

  /// レシピを更新します。
  Future<void> updateRecipe(Recipe recipe) async {
    try {
      await _repository.updateRecipe(recipe);
    } catch (e) {
      throw Exception('Failed to update recipe: $e');
    }
  }

  /// レシピにいいねをつけます。
  Future<void> likeRecipe(Recipe recipe, User currentUser) async {
    final hasLiked = recipe.likes.any((like) => like.user.id == currentUser.id);
    if (hasLiked) {
      return;
    }

    final createdLike = Like(
      id: '${recipe.id}_${currentUser.id}',
      user: currentUser,
      createdAt: _now,
    );
    final updatedLikes = List.of(recipe.likes)..add(createdLike);
    final updatedRecipe = recipe.copyWith(
      likes: updatedLikes,
      likesCounts: recipe.likesCounts + 1,
    );

    try {
      await _repository.updateRecipe(updatedRecipe);
    } catch (e) {
      throw Exception('Failed to like recipe: $e');
    }
  }

  /// レシピのいいねを取り消します。
  Future<void> undoLikeRecipe(Recipe recipe, User currentUser) async {
    final hasLiked = recipe.likes.any((like) => like.user.id == currentUser.id);
    if (!hasLiked) {
      return;
    }

    final updatedLikes = List.of(recipe.likes)
      ..removeWhere((like) => like.user.id == currentUser.id);
    final updatedRecipe = recipe.copyWith(
      likes: updatedLikes,
      likesCounts: (recipe.likesCounts > 0) ? recipe.likesCounts - 1 : 0,
    );

    try {
      await _repository.updateRecipe(updatedRecipe);
    } catch (e) {
      throw Exception('Failed to undo like for recipe: $e');
    }
  }

  /// ユーザーを投稿します。
  Future<void> postUser(User user) async {
    try {
      await _repository.setUser(user);
    } catch (e) {
      throw Exception('Failed to post user: $e');
    }
  }

  /// ユーザー一覧を取得します。
  Future<List<User>> getUsers() async {
    try {
      return await _repository.getUsers();
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }

  /// 指定したユーザーIDのユーザーを取得します。
  Future<User> getUserById(String userId) async {
    try {
      return await _repository.getUserById(userId);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  /// ユーザーを更新します。
  ///
  /// [user] には更新対象のユーザーを指定します。
  /// [authenticatedUser] には更新を行うユーザーを指定します。
  /// [name] には更新後のユーザー名を指定します。
  /// [imageUrl] には更新後の画像URLを指定します。
  /// [profileDescription] には更新後のプロフィール説明を指定します。
  ///
  /// [user] が [authenticatedUser] と一致しない場合、
  /// ArgumentErrorをスローします。
  ///
  Future<void> updateUser({
    required User user,
    required User authenticatedUser,
    String? name,
    String? imageUrl,
    String? profileDescription,
  }) async {
    if (name == null && imageUrl == null && profileDescription == null) {
      return;
    }
    if (user.id != authenticatedUser.id) {
      throw ArgumentError('User does not match authenticated user');
    }
    final updatedUser = user.copyWith(
      name: name ?? user.name,
      imageUrl: imageUrl ?? user.imageUrl,
      profileDescription: profileDescription ?? user.profileDescription,
    );
    try {
      await _repository.updateUser(updatedUser);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
