import 'package:client/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailPage extends ConsumerStatefulWidget {
  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('レシピ詳細画面'),
      ),
      body: Center(
        child: Text('title: ${widget.recipe.title}'),
      ),
    );
  }
}
