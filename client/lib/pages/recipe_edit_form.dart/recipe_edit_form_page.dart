import 'package:client/components/recipe_form_view.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RecipeEditFormPage extends ConsumerStatefulWidget {
  const RecipeEditFormPage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  ConsumerState createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends ConsumerState<RecipeEditFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
        title: Text(
          'レシピを更新',
          style: context.textTheme.titleMediumBold,
        ),
      ),
      body: SafeArea(child: RecipeFormView(recipe: widget.recipe)),
    );
  }
}
