import 'package:client/constants/mock_data.dart';
import 'package:client/enums/app_page.dart';
import 'package:client/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RecipeListPage extends ConsumerStatefulWidget {
  const RecipeListPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<RecipeListPage> {
  void _onTapRecipeItem(Recipe tappedRecipe) {
    context.push(
      AppPage.recipeDetail.path,
      extra: tappedRecipe,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('レシピ一覧画面'),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes.elementAt(index);
              return ElevatedButton(
                onPressed: () => _onTapRecipeItem(recipe),
                child: Text('レシピ詳細画面（title: ${recipe.title}）へ遷移'),
              );
            },
          ),
        ),
      ),
    );
  }
}
