import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class RecipeStepsComponent extends StatelessWidget {
  const RecipeStepsComponent({super.key});
  @override
  Widget build(BuildContext context) {
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // API繋ぎ込みで修正が必要
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    final apiData = {
      'ingredients': [
        {'name': '材料A材料A材料A材料A材料A材料A材料A材料A材料A材料A', 'amount': '10g'},
        {'name': '材料B', 'amount': '20g'},
        {'name': '材料C', 'amount': '30g'},
        {'name': '材料D', 'amount': '40g'},
        {'name': '材料E', 'amount': '50g'},
      ],
      'harvestingMethods': [
        {
          'step': '1',
          'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト',
          'image': 'assets/images/FlyedSawagani.png',
        },
        {
          'step': '2',
          'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト',
          'image': 'assets/images/FlyedSawagani.png',
        },
        {
          'step': '3',
          'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト',
          'image': 'assets/images/FlyedSawagani.png',
        },
      ],
      'cookingMethods': [
        {
          'step': '1',
          'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト',
          'image': 'assets/images/FlyedSawagani.png',
        },
        {
          'step': '2',
          'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト',
          'image': 'assets/images/FlyedSawagani.png',
        },
        {
          'step': '3',
          'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト',
          'image': 'assets/images/FlyedSawagani.png',
        },
      ],
      'tips':
          'コツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキスト',
      'eatReport': '感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト',
      'aiComment': 'コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント',
    };
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                _buildIngredientsSection(
                  apiData['ingredients']! as List<Map<String, String>>,
                  context,
                ),
                const SizedBox(height: 48),
                _buildHarvestingMethodsSection(
                  apiData['harvestingMethods']! as List<Map<String, String>>,
                  context,
                ),
                const SizedBox(height: 48),
                _buildCookingMethodsSection(
                  apiData['cookingMethods']! as List<Map<String, String>>,
                  context,
                ),
                const SizedBox(height: 48),
                _buildTipsSection(
                  apiData['tips']! as String,
                  context,
                ),
                const SizedBox(height: 48),
                _buildEatReportSection(
                  apiData['eatReport']! as String,
                  context,
                ),
                const SizedBox(height: 48),
                _buildAICommentSection(
                  apiData['aiComment']! as String,
                  context,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsSection(
    List<Map<String, String>> ingredients,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('材料', '(2人前)', context),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.gray4),
          ),
          child: Column(
            children: List.generate(ingredients.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            ingredients[index]['name']!,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: AppColors.gray1,
                            ),
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          ingredients[index]['amount']!,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: AppColors.gray1,
                          ),
                        ),
                      ],
                    ),
                    if (index < ingredients.length - 1)
                      const Divider(
                        color: AppColors.gray4,
                        thickness: 1,
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildHarvestingMethodsSection(
    List<Map<String, String>> harvestingMethods,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('採集方法', '', context),
        const SizedBox(height: 16),
        Column(
          children: harvestingMethods.map((method) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.gray3,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.green1,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        method['step']!,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        method['description']!,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray1,
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        method['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCookingMethodsSection(
    List<Map<String, String>> cookingMethods,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('料理方法', '', context),
        const SizedBox(height: 16),
        Column(
          children: cookingMethods.map((method) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.gray3,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.green1,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        method['step']!,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        method['description']!,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray1,
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        method['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTipsSection(String tips, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('コツ・ポイント', '', context),
        const SizedBox(height: 16),
        Text(
          tips,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.gray1,
          ),
        ),
      ],
    );
  }

  Widget _buildEatReportSection(String eatReport, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('食レポ', '', context),
        const SizedBox(height: 16),
        Text(
          eatReport,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.gray1,
          ),
        ),
      ],
    );
  }

  Widget _buildAICommentSection(String aiComment, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('AIの補足コメント', '', context),
        const SizedBox(height: 16),
        Text(
          aiComment,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.gray1,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.red2,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.error,
                size: 20,
                color: AppColors.red1,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'AI補足コメントは、参考情報として提供されるものであり正確性や最新性を保証するものではありません。',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: AppColors.gray1,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title, String subtitle, BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: context.textTheme.titleLargeBold?.copyWith(
                color: AppColors.gray1,
              ),
            ),
            Text(
              subtitle,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.gray1,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 1,
          left: 0,
          right: 0,
          child: Container(
            height: 5,
            color: AppColors.green1_50,
          ),
        ),
      ],
    );
  }
}
