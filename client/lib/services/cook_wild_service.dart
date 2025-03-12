import 'package:client/models/models.dart';
import 'package:client/repository/firestore_repository.dart';

/// CookWild のバックエンドとのデータ操作を行うクラス。
///
/// シングルトンパターンを採用しており、`CookWildService.instance` で利用できます。
class CookWildService {
  CookWildService._();
  static final CookWildService instance = CookWildService._();

  final _repository = FirestoreRepository.instance;

  final _now = DateTime.now();

  /// コメントを投稿します。
  Future<void> postComment(Comment comment) async {
    try {
      await _repository.setComment(comment);
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

  /// 調理手順を投稿します。
  Future<void> postCookingStep(CookingSteps cookingSteps) async {
    try {
      await _repository.setCookingSteps(cookingSteps);
    } catch (e) {
      throw Exception('Failed to post cooking step: $e');
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

  /// 採取方法を投稿します。
  Future<void> postGatheringStep(GatheringSteps gatheringSteps) async {
    try {
      await _repository.setGatheringSteps(gatheringSteps);
    } catch (e) {
      throw Exception('Failed to post gathering step: $e');
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

  /// 食材を投稿します。
  Future<void> postIngredient(Ingredient ingredient) async {
    try {
      await _repository.setIngredient(ingredient);
    } catch (e) {
      throw Exception('Failed to post ingredient: $e');
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

  /// いいねを投稿します。
  Future<void> postLike(Like like) async {
    try {
      await _repository.setLike(like);
    } catch (e) {
      throw Exception('Failed to post like: $e');
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
    final createdLike = Like(
      id: '${recipe.id}_${currentUser.id}',
      user: currentUser,
      createdAt: _now,
    );
    final updatedRecipe = recipe.copyWith(
      likes: [...recipe.likes, createdLike],
      likesCounts: recipe.likesCounts + 1,
    );
    try {
      await _repository.updateRecipe(updatedRecipe);
    } catch (e) {
      throw Exception('Failed to like recipe: $e');
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
}
