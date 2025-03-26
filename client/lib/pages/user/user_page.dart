import 'package:client/components/user_contents.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/constants/mock_data.dart';
import 'package:client/pages/user/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({
    super.key,
  });
  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<UserPage> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      if (mounted) {
        // mounted を確認
        await ref.read(userNotifierProvider.notifier).fetchRecipesAndUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userNotifierProvider);
    final recipes =
        state.recipes.where((recipe) => recipe.user.id == 'user2-id').toList();

    // print('state: ${user2}');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SafeArea(
        child: UserContents(
          user: recipes[0].user,
          recipes: recipes,
          likedRecipes: recipes,
          isCurrentUser: false,
        ),
      ),
    );
  }
}
