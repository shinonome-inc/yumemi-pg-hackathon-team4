import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/pages/recipe_form/recipe_form_steps_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeFormPage extends ConsumerStatefulWidget {
  const RecipeFormPage({super.key});

  @override
  ConsumerState createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends ConsumerState<RecipeFormPage> {
  final List<Map<String, String>> _ingredients = [
    {'name': '', 'amount': ''},
  ];
  final List<String> _gatheringSteps = [''];
  final List<String> _cookingSteps = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
        title: Text(
          'レシピを書く',
          style: context.textTheme.titleMediumBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
          child: Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                spacing: 32,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.gray4,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.gray3,
                        ),
                      ),
                      child: Column(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            color: AppColors.gray2,
                            size: 64,
                          ),
                          Text(
                            '料理の写真をのせる',
                            style: context.textTheme.titleMediumBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 32,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'タイトル',
                              style: context.textTheme.titleSmallBold,
                            ),
                            TextField(
                              maxLength: 20,
                              decoration: InputDecoration(
                                hintText: 'カメノテお味噌汁',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'レシピの紹介文',
                              style: context.textTheme.titleSmallBold,
                            ),
                            TextField(
                              maxLength: 100,
                              minLines: 2,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'カメノテが落ちていたので，作ってみました！！♫♫♫',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              '材料',
                              style: context.textTheme.titleMediumBold,
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '2人分',
                                  hintStyle:
                                      context.textTheme.titleSmall?.copyWith(
                                    color: AppColors.gray3,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.gray3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _ingredients.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: '材料',
                                            hintStyle: context
                                                .textTheme.titleSmall
                                                ?.copyWith(
                                              color: AppColors.gray3,
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.gray3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: '分量',
                                            hintStyle: context
                                                .textTheme.titleSmall
                                                ?.copyWith(
                                              color: AppColors.gray3,
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.gray3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              height: 40,
                              alignment: Alignment.center,
                              child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _ingredients
                                        .add({'name': '', 'amount': ''});
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.green1,
                                ),
                                label: const Text(
                                  '材料を追加',
                                  style: TextStyle(color: AppColors.green1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 採集方法
                        StepsItem(
                          stepType: StepType.gathering,
                          stepList: _gatheringSteps,
                        ),
                        // 作り方
                        StepsItem(
                          stepType: StepType.cooking,
                          stepList: _cookingSteps,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'コツ',
                              style: context.textTheme.titleMediumBold,
                            ),
                            TextField(
                              maxLength: 60,
                              minLines: 2,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'この料理のアイデアや、おいしく作るコツ',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '食レポ',
                              style: context.textTheme.titleMediumBold,
                            ),
                            TextField(
                              maxLength: 60,
                              minLines: 2,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: '使ったワイルドフードの味、食感、何に似ているか',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('レシピを公開する'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
