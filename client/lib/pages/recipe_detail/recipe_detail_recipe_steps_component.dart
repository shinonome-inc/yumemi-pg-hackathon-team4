import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/models/models.dart';
import 'package:flutter/material.dart';

class RecipeStepsComponent extends StatelessWidget {
  const RecipeStepsComponent({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final apiData = {
      'ingredients': recipe.ingredients,
      'gatheringSteps': recipe.gatheringSteps,
      'cookingSteps': recipe.cookingSteps,
      'tips': recipe.tips,
      'eatReport': recipe.description,
      'aiComment': recipe.aiComment,
    };
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                _buildIngredientsSection(
                  recipe.ingredients,
                  context,
                ),
                const SizedBox(height: 48),
                _buildGatheringStepsSection(
                  recipe.gatheringSteps,
                  context,
                ),
                const SizedBox(height: 48),
                _buildCookingMethodsSection(
                  recipe.cookingSteps,
                  context,
                ),
                const SizedBox(height: 48),
                _buildTipsSection(
                  apiData['tips'] as String?,
                  context,
                ),
                const SizedBox(height: 48),
                _buildEatReportSection(
                  apiData['eatReport'] as String?,
                  context,
                ),
                const SizedBox(height: 48),
                _buildAICommentSection(
                  apiData['aiComment'] as String?,
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
    List<Ingredient> ingredients,
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 9.5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            ingredients[index].ingredientName,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: AppColors.gray1,
                            ),
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          ingredients[index].quantity,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: AppColors.gray1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index < ingredients.length - 1)
                    const Padding(
                      padding: EdgeInsets.zero,
                      child: Divider(
                        color: AppColors.gray4,
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildGatheringStepsSection(
    List<GatheringSteps> gatheringSteps,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('採集方法', '', context),
        const SizedBox(height: 12),
        Column(
          children: gatheringSteps.asMap().entries.map((entry) {
            final index = entry.key;
            final method = entry.value;
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
                        '${index + 1}',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        method.description,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray1,
                        ),
                        softWrap: true,
                      ),
                    ),
                    // const SizedBox(width: 8),
                    // SizedBox(
                    //   width: 80,
                    //   height: 80,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(4),
                    //     child: Image.network(
                    //       method.imageUrl ?? '',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
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
    List<CookingSteps> cookingMethods,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('料理方法', '', context),
        const SizedBox(height: 12),
        Column(
          children: cookingMethods.asMap().entries.map((entry) {
            final index = entry.key;
            final method = entry.value;
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
                        '${index + 1}',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        method.description,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray1,
                        ),
                        softWrap: true,
                      ),
                    ),
                    // const SizedBox(width: 8),
                    // SizedBox(
                    //   width: 80,
                    //   height: 80,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(4),
                    //     child: Image.asset(
                    //       method.imageUrl ?? '',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTipsSection(String? tips, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('コツ・ポイント', '', context),
        const SizedBox(height: 12),
        Text(
          tips ?? '',
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.gray1,
          ),
        ),
      ],
    );
  }

  Widget _buildEatReportSection(String? eatReport, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('食レポ', '', context),
        const SizedBox(height: 12),
        Text(
          eatReport ?? '',
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.gray1,
          ),
        ),
      ],
    );
  }

  Widget _buildAICommentSection(String? aiComment, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('AIの補足コメント', '', context),
        const SizedBox(height: 12),
        Text(
          aiComment ?? '',
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
