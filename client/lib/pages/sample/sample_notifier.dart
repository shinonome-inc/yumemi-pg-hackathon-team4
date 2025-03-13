import 'package:client/models/recipe.dart';
import 'package:client/models/user.dart';
import 'package:client/pages/sample/sample_state.dart';
import 'package:client/services/cook_wild_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_notifier.g.dart';

/// stateを管理し、状態の変更を行うクラス。
///
/// 状態を保持し、状態を更新するためのメソッドを提供する。
@riverpod
class SampleNotifier extends _$SampleNotifier {
  /// 初期状態を構築する。
  @override
  SampleState build() {
    return initialSampleState;
  }

  void setIsLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setRecipes({required List<Recipe> recipes}) {
    state = state.copyWith(recipes: recipes);
  }

  void setUsers({required List<User> users}) {
    state = state.copyWith(users: users);
  }

  Future<void> fetchRecipesAndUsers() async {
    setIsLoading(isLoading: true);
    try {
      final recipes = await CookWildService.instance.getRecipes();
      final users = await CookWildService.instance.getUsers();
      setRecipes(recipes: recipes);
      setUsers(users: users);
    } catch (e) {
      throw Exception('Failed to fetch recipes or users: $e');
    } finally {
      setIsLoading(isLoading: false);
    }
  }
}
