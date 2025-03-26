import 'package:client/components/user_contents.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/constants/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<UserPage> {
  @override
  Widget build(BuildContext context) {
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
          user: user1,
          recipes: recipes,
          likedRecipes: recipes,
          isCurrentUser: false,
        ),
      ),
    );
  }
}
