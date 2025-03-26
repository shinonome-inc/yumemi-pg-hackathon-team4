import 'package:client/components/network_error_view.dart';
import 'package:client/components/user_contents.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/constants/mock_data.dart';
import 'package:client/enums/app_page.dart';
import 'package:client/providers/signed_in_user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CurrentUserPage extends ConsumerStatefulWidget {
  const CurrentUserPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<CurrentUserPage> {
  @override
  Widget build(BuildContext context) {
    final signedInUser = ref.watch(signedInUserNotifierProvider);
    if (signedInUser == null) {
      // TODO: 専用のエラー画面を用意する（優先度・低）。
      return const NetworkError();
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
            onPressed: () => context.push(AppPage.settings.path),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: UserContents(
          user: signedInUser,
          recipes: recipes,
          likedRecipes: recipes,
          isCurrentUser: true,
        ),
      ),
    );
  }
}
