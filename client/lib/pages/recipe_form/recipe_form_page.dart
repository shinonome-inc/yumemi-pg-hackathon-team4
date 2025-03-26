import 'package:client/components/recipe_form_view.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/enums/app_page.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/pages/recipe_form/recipe_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RecipeFormPage extends ConsumerStatefulWidget {
  const RecipeFormPage({super.key});

  @override
  ConsumerState createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends ConsumerState<RecipeFormPage> {
  Future<void> _onSubmit(
    String title,
    String description,
    List<Map<String, String>> ingredients,
    List<RecipeStep> gatheringSteps,
    List<RecipeStep> cookingSteps,
    String tips,
    String? imageUrl,
  ) async {
    await ref.read(recipeFormNotifierProvider.notifier).submitRecipe(
          title: title,
          description: description,
          ingredients: ingredients,
          gatheringSteps: gatheringSteps,
          cookingSteps: cookingSteps,
          tips: tips,
          imageUrl: imageUrl,
        );
    context.go(AppPage.recipeList.path); // 現状、一覧に遷移しても新規作成したレシピは反映されない
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipeFormNotifierProvider);
    final notifier = ref.read(recipeFormNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'レシピを書く',
          style: context.textTheme.titleMediumBold,
        ),
      ),
      body: SafeArea(
        child: RecipeFormView(
          onSubmit: _onSubmit,
          state: state,
          notifier: notifier,
        ),
      ),
    );
  }
}
