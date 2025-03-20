import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left)),
        // title: const Text('User'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://avatars.githubusercontent.com/u/77449593?v=4',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'ユーザー名',
                          style: context.textTheme.titleLargeBold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '自己紹介テキスト自己紹介テキスト自己紹介テキスト自己紹介テキスト自己紹介テキスト自己紹介テキスト',
                    style: context.textTheme.bodyMedium,
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
                            '（6）', // 揃えるために全角括弧を使用
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
                            children: List.generate(
                              6, // レシピ数
                              (index) => SizedBox(
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
                                      'レシピ名レシピ名レシピ名レシピ名レシピ名レシピ名',
                                      maxLines: 2,
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                            '（6）', // 揃えるために全角括弧を使用
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
                            children: List.generate(
                              6, // レシピ数
                              (index) => SizedBox(
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
                                      'レシピ名レシピ名レシピ名レシピ名レシピ名レシピ名',
                                      maxLines: 2,
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
        ),
      ),
    );
  }
}
