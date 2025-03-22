import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/models/recipe.dart';
import 'package:flutter/material.dart';

class UserContents extends StatelessWidget {
  const UserContents({
    super.key,
    required this.username,
    required this.imageUrl,
    required this.profileDescription,
    required this.recipes,
    required this.likedRecipes,
    required this.isCurrentUser,
  });

  final String username;
  final String imageUrl;
  final String profileDescription;
  final List<Recipe> recipes;
  final List<Recipe> likedRecipes;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        spacing: 24,
        children: [
          // ユーザー情報
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 16,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      username,
                      style: context.textTheme.titleLargeBold,
                    ),
                  ),
                ],
              ),
              Text(
                profileDescription,
                style: context.textTheme.bodyMedium,
              ),
              if (isCurrentUser)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('プロフィールを編集'),
                  ),
                ),
            ],
          ),

          Column(
            spacing: 40,
            children: [
              // このユーザーのレシピ
              Column(
                spacing: 12,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text('レシピ', style: context.textTheme.titleMediumBold),
                      Text(
                        '（${recipes.length}）', // 揃えるために全角括弧を使用
                        style: context.textTheme.titleMediumBold
                            ?.copyWith(color: AppColors.gray2),
                      ),
                    ],
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final itemWidth =
                          (constraints.maxWidth - 16) / 3; // レシピの幅を計算
                      return Wrap(
                        spacing: 8, // 列間のスペース
                        runSpacing: 20, // 行間のスペース
                        children: recipes
                            .map(
                              (recipe) => SizedBox(
                                width: itemWidth, // レシピの幅を設定
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                              'https://picsum.photos/200/300',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      recipe.title,
                                      maxLines: 2,
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'もっと見る',
                        style: context.textTheme.bodyMediumBold?.copyWith(
                          color: AppColors.green1,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        side: const BorderSide(
                          width: 2,
                          color: AppColors.green1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //　いいねしたレシピ
              Column(
                spacing: 12,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        'いいねしたレシピ',
                        style: context.textTheme.titleMediumBold,
                      ),
                      Text(
                        '（${likedRecipes.length}）', // 揃えるために全角括弧を使用
                        style: context.textTheme.titleMediumBold
                            ?.copyWith(color: AppColors.gray2),
                      ),
                    ],
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final itemWidth =
                          (constraints.maxWidth - 16) / 3; // レシピの幅を計算
                      return Wrap(
                        spacing: 8, // 列間のスペース
                        runSpacing: 20, // 行間のスペース
                        children: likedRecipes
                            .map(
                              (recipe) => SizedBox(
                                width: itemWidth, // レシピの幅を設定
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                              'https://picsum.photos/200/300',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      recipe.title,
                                      maxLines: 2,
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'もっと見る',
                        style: context.textTheme.bodyMediumBold?.copyWith(
                          color: AppColors.green1,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        side: const BorderSide(
                          width: 2,
                          color: AppColors.green1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
