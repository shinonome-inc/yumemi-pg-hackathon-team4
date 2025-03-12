import 'package:client/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore のコレクションパスを定義する列挙型です。
enum _CollectionPath {
  comments,
  cookingSteps,
  gatheringSteps,
  ingredients,
  likes,
  recipes,
  users,
}

/// Firestore によるデータ操作を行うクラスです。
///
/// シングルトンパターンを採用しており、`FirestoreRepository.instance` で利用できます。
class FirestoreRepository {
  FirestoreRepository._();
  static final FirestoreRepository instance = FirestoreRepository._();

  final _firestore = FirebaseFirestore.instance;

  /// コメントを投稿します。
  Future<void> setComment(Comment comment) async {
    await _firestore
        .collection(_CollectionPath.comments.name)
        .doc(comment.id)
        .set(comment.toJson());
  }

  /// コメント一覧を取得します。
  Future<List<Comment>> getComments() async {
    final snapshot =
        await _firestore.collection(_CollectionPath.comments.name).get();
    return snapshot.docs.map((doc) => Comment.fromJson(doc.data())).toList();
  }

  /// 指定したコメントIDのコメントを取得します。
  Future<Comment> getCommentById(String commentId) async {
    final doc = await _firestore
        .collection(_CollectionPath.comments.name)
        .doc(commentId)
        .get();
    final data = doc.data();
    if (data == null) {
      throw Exception('Comment not found');
    }
    return Comment.fromJson(data);
  }

  /// 調理手順を投稿します。
  Future<void> setCookingSteps(CookingSteps cookingSteps) async {
    await _firestore
        .collection(_CollectionPath.cookingSteps.name)
        .doc(cookingSteps.id)
        .set(cookingSteps.toJson());
  }

  /// 調理手順一覧を取得します。
  Future<List<CookingSteps>> getCookingSteps() async {
    final snapshot =
        await _firestore.collection(_CollectionPath.cookingSteps.name).get();
    return snapshot.docs
        .map((doc) => CookingSteps.fromJson(doc.data()))
        .toList();
  }

  /// 指定したIDの調理手順を取得します。
  Future<CookingSteps> getCookingStepsById(String cookingStepsId) async {
    final doc = await _firestore
        .collection(_CollectionPath.cookingSteps.name)
        .doc(cookingStepsId)
        .get();
    final data = doc.data();
    if (data == null) {
      throw Exception('CookingSteps not found');
    }
    return CookingSteps.fromJson(data);
  }

  /// 採取方法を投稿します。
  Future<void> setGatheringSteps(GatheringSteps gatheringSteps) async {
    await _firestore
        .collection(_CollectionPath.gatheringSteps.name)
        .doc(gatheringSteps.id)
        .set(gatheringSteps.toJson());
  }

  /// 採取方法一覧を取得します。
  Future<List<GatheringSteps>> getGatheringSteps() async {
    final snapshot =
        await _firestore.collection(_CollectionPath.gatheringSteps.name).get();
    return snapshot.docs
        .map((doc) => GatheringSteps.fromJson(doc.data()))
        .toList();
  }

  /// 指定したIDの採取方法を取得します。
  Future<GatheringSteps> getGatheringStepsById(String gatheringStepsId) async {
    final doc = await _firestore
        .collection(_CollectionPath.gatheringSteps.name)
        .doc(gatheringStepsId)
        .get();
    final data = doc.data();
    if (data == null) {
      throw Exception('GatheringSteps not found');
    }
    return GatheringSteps.fromJson(data);
  }

  /// 食材を投稿します。
  Future<void> setIngredient(Ingredient ingredient) async {
    await _firestore
        .collection(_CollectionPath.ingredients.name)
        .doc(ingredient.id)
        .set(ingredient.toJson());
  }

  /// 食材一覧を取得します。
  Future<List<Ingredient>> getIngredients() async {
    final snapshot =
        await _firestore.collection(_CollectionPath.ingredients.name).get();
    return snapshot.docs.map((doc) => Ingredient.fromJson(doc.data())).toList();
  }

  /// 指定したIDの食材を取得します。
  Future<Ingredient> getIngredientById(String ingredientId) async {
    final doc = await _firestore
        .collection(_CollectionPath.ingredients.name)
        .doc(ingredientId)
        .get();
    final data = doc.data();
    if (data == null) {
      throw Exception('Ingredient not found');
    }
    return Ingredient.fromJson(data);
  }

  /// いいねを投稿します。
  Future<void> setLike(Like like) async {
    await _firestore
        .collection(_CollectionPath.likes.name)
        .doc(like.id)
        .set(like.toJson());
  }

  /// いいね一覧を取得します。
  Future<List<Like>> getLikes() async {
    final snapshot =
        await _firestore.collection(_CollectionPath.likes.name).get();
    return snapshot.docs.map((doc) => Like.fromJson(doc.data())).toList();
  }

  /// 指定したIDのいいねを取得します。
  Future<Like> getLikeById(String likeId) async {
    final doc = await _firestore
        .collection(_CollectionPath.likes.name)
        .doc(likeId)
        .get();
    final data = doc.data();
    if (data == null) {
      throw Exception('Like not found');
    }
    return Like.fromJson(data);
  }

  /// レシピを投稿します。
  Future<void> setRecipe(Recipe recipe) async {
    await _firestore
        .collection(_CollectionPath.recipes.name)
        .doc(recipe.id)
        .set(recipe.toJson());
  }

  /// レシピ一覧を取得します。
  Future<List<Recipe>> getRecipes() async {
    final snapshot =
        await _firestore.collection(_CollectionPath.recipes.name).get();
    return snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList();
  }

  /// 指定したIDのレシピを取得します。
  Future<Recipe> getRecipeById(String recipeId) async {
    final doc = await _firestore
        .collection(_CollectionPath.recipes.name)
        .doc(recipeId)
        .get();
    final data = doc.data();
    if (data == null) {
      throw Exception('Recipe not found');
    }
    return Recipe.fromJson(data);
  }

  /// レシピを更新します。
  Future<void> updateRecipe(Recipe recipe) async {
    await _firestore
        .collection(_CollectionPath.recipes.name)
        .doc(recipe.id)
        .update(recipe.toJson());
  }

  /// ユーザーを投稿します。
  Future<void> setUser(User user) async {
    await _firestore
        .collection(_CollectionPath.users.name)
        .doc(user.id)
        .set(user.toJson());
  }

  /// ユーザー一覧を取得します。
  Future<List<User>> getUsers() async {
    final snapshot =
        await _firestore.collection(_CollectionPath.users.name).get();
    return snapshot.docs.map((doc) => User.fromJson(doc.data())).toList();
  }

  /// 指定したIDのユーザーを取得します。
  Future<User> getUserById(String userId) async {
    final doc = await _firestore
        .collection(_CollectionPath.users.name)
        .doc(userId)
        .get();
    final data = doc.data();
    if (data == null) {
      throw Exception('User not found');
    }
    return User.fromJson(data);
  }
}
