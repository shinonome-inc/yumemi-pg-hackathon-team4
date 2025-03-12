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

/// Cloud Firestore によるデータ操作を行うクラスです。
/// シングルトンパターンを採用しており、`FirestoreService.instance` で利用できます。
class FirestoreService {
  FirestoreService._();
  static final FirestoreService instance = FirestoreService._();

  final _instance = FirebaseFirestore.instance;

  /// コメントを投稿します。
  Future<void> postComment(Comment comment) async {
    final data = {
      ...comment.toJson(),
      'user': comment.user.toJson(),
    };
    try {
      await _instance
          .collection(_CollectionPath.comments.name)
          .doc(comment.id)
          .set(data);
    } catch (e) {
      throw Exception('Failed to post comment: $e');
    }
  }

  /// コメント一覧を取得します。
  Future<List<Comment>> getComments() async {
    try {
      final snapshot =
          await _instance.collection(_CollectionPath.comments.name).get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Comment.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get comments: $e');
    }
  }

  /// 指定したコメントIDのコメントを取得します。
  Future<Comment> getCommentById(String commentId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(_CollectionPath.comments.name)
          .doc(commentId)
          .get();
      final data = doc.data();
      if (data == null) {
        throw Exception('Comment not found');
      }
      return Comment.fromJson(data);
    } catch (e) {
      throw Exception('Failed to get comment: $e');
    }
  }

  /// 調理手順を Firestore に投稿します。
  Future<void> postCookingSteps(CookingSteps cookingSteps) async {
    try {
      await _instance
          .collection(_CollectionPath.cookingSteps.name)
          .doc(cookingSteps.id)
          .set(cookingSteps.toJson());
    } catch (e) {
      throw Exception('Failed to post cooking steps: $e');
    }
  }

  /// 調理手順一覧を取得します。
  Future<List<CookingSteps>> getCookingSteps() async {
    try {
      final snapshot =
          await _instance.collection(_CollectionPath.cookingSteps.name).get();
      return snapshot.docs
          .map((doc) => CookingSteps.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get cooking steps: $e');
    }
  }

  /// 指定した調理手順 ID の調理手順を取得します。
  Future<CookingSteps> getCookingStepById(String id) async {
    try {
      final doc = await _instance
          .collection(_CollectionPath.cookingSteps.name)
          .doc(id)
          .get();
      final data = doc.data();
      if (data == null) {
        throw Exception('Cooking step not found');
      }
      return CookingSteps.fromJson(data);
    } catch (e) {
      throw Exception('Failed to get cooking step: $e');
    }
  }

  /// 採取手順を Firestore に投稿します。
  Future<void> postGatheringSteps(GatheringSteps gatheringSteps) async {
    try {
      await _instance
          .collection(_CollectionPath.gatheringSteps.name)
          .doc(gatheringSteps.id)
          .set(gatheringSteps.toJson());
    } catch (e) {
      throw Exception('Failed to post gathering steps: $e');
    }
  }

  /// 採取手順一覧を取得します。
  Future<List<GatheringSteps>> getGatheringSteps() async {
    try {
      final snapshot =
          await _instance.collection(_CollectionPath.gatheringSteps.name).get();
      return snapshot.docs
          .map((doc) => GatheringSteps.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get gathering steps: $e');
    }
  }

  /// 指定した採取手順 ID の採取手順を取得します。
  Future<GatheringSteps> getGatheringStepById(String id) async {
    try {
      final doc = await _instance
          .collection(_CollectionPath.gatheringSteps.name)
          .doc(id)
          .get();
      final data = doc.data();
      if (data == null) {
        throw Exception('Gathering step not found');
      }
      return GatheringSteps.fromJson(data);
    } catch (e) {
      throw Exception('Failed to get gathering step: $e');
    }
  }

  /// 食材を Firestore に投稿します。
  Future<void> postIngredient(Ingredient ingredient) async {
    try {
      await _instance
          .collection(_CollectionPath.ingredients.name)
          .doc(ingredient.id)
          .set(ingredient.toJson());
    } catch (e) {
      throw Exception('Failed to post ingredient: $e');
    }
  }

  /// 食材一覧を取得します。
  Future<List<Ingredient>> getIngredients() async {
    try {
      final snapshot =
          await _instance.collection(_CollectionPath.ingredients.name).get();
      return snapshot.docs
          .map((doc) => Ingredient.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get ingredients: $e');
    }
  }

  /// 指定した食材 ID の食材を取得します。
  Future<Ingredient> getIngredientById(String id) async {
    try {
      final doc = await _instance
          .collection(_CollectionPath.ingredients.name)
          .doc(id)
          .get();
      final data = doc.data();
      if (data == null) {
        throw Exception('Ingredient not found');
      }
      return Ingredient.fromJson(data);
    } catch (e) {
      throw Exception('Failed to get ingredient: $e');
    }
  }

  /// いいねを Firestore に投稿します。
  Future<void> postLike(Like like) async {
    try {
      await _instance
          .collection(_CollectionPath.likes.name)
          .doc(like.id)
          .set(like.toJson());
    } catch (e) {
      throw Exception('Failed to post like: $e');
    }
  }

  /// いいね一覧を取得します。
  Future<List<Like>> getLikes() async {
    try {
      final snapshot =
          await _instance.collection(_CollectionPath.likes.name).get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Like.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get likes: $e');
    }
  }

  /// 指定したいいねIDのいいねを取得します。
  Future<Like> getLikeById(String likeId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(_CollectionPath.likes.name)
          .doc(likeId)
          .get();
      final data = doc.data();
      if (data == null) {
        throw Exception('Like not found');
      }
      return Like.fromJson(data);
    } catch (e) {
      throw Exception('Failed to get like: $e');
    }
  }

  /// レシピを Firestore に投稿します。
  Future<void> postRecipe(Recipe recipe) async {
    try {
      await _instance
          .collection(_CollectionPath.recipes.name)
          .doc(recipe.id)
          .set(recipe.toJson());
    } catch (e) {
      throw Exception('Failed to post recipe: $e');
    }
  }

  /// レシピ一覧を取得します。
  Future<List<Recipe>> getRecipes() async {
    try {
      final snapshot =
          await _instance.collection(_CollectionPath.recipes.name).get();
      return snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to get recipes: $e');
    }
  }

  /// 指定したレシピ ID のレシピを取得します。
  Future<Recipe> getRecipeById(String recipeId) async {
    try {
      final doc = await _instance
          .collection(_CollectionPath.recipes.name)
          .doc(recipeId)
          .get();
      final data = doc.data();
      if (data == null) {
        throw Exception('Recipe not found');
      }
      return Recipe.fromJson(data);
    } catch (e) {
      throw Exception('Failed to get recipe: $e');
    }
  }

  /// ユーザー一覧を取得します。
  Future<List<User>> getUsers() async {
    try {
      final snapshot =
          await _instance.collection(_CollectionPath.users.name).get();
      return snapshot.docs.map((doc) => User.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }

  /// 指定したユーザー ID のユーザー情報を取得します。
  Future<User> getUserById(String userId) async {
    try {
      final doc = await _instance
          .collection(_CollectionPath.users.name)
          .doc(userId)
          .get();
      final data = doc.data();
      if (data == null) {
        throw Exception('User not found');
      }
      return User.fromJson(data);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }
}
