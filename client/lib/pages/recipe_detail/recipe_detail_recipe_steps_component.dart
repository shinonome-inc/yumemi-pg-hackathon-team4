import 'package:client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecipeStepsComponent extends StatelessWidget {
  const RecipeStepsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIngredientsSection(),
          const SizedBox(height: 48),
          _buildHarvestingMethodsSection(),
          const SizedBox(height: 48),
          _buildCookingMethodsSection(),
          const SizedBox(height: 48),
          _buildTipsSection(),
          const SizedBox(height: 48),
          _buildEatReportSection(),
          const SizedBox(height: 48),
          _buildAICommentSection(),
        ],
      ),
    );
  }

  Widget _buildIngredientsSection() {
    final ingredients = <Map<String, String>>[
      {'name': '材料A材料A材料A材料A材料A材料A材料A材料A材料A材料A', 'amount': '10g'},
      {'name': '材料B', 'amount': '20g'},
      {'name': '材料C', 'amount': '30g'},
      {'name': '材料D', 'amount': '40g'},
      {'name': '材料E', 'amount': '50g'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('材料', '(2人前)'),
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
                            style: const TextStyle(fontSize: 16),
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          ingredients[index]['amount']!,
                          style: const TextStyle(fontSize: 16),
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

  Widget _buildHarvestingMethodsSection() {
    final harvestingMethods = [
      {'step': '1', 'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト'},
      {'step': '2', 'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト'},
      {'step': '3', 'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('採集方法', ''),
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
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        method['description']!,
                        style: const TextStyle(fontSize: 16),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/FlyedSawagani.png',
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

  Widget _buildCookingMethodsSection() {
    final cookingMethods = [
      {'step': '1', 'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト'},
      {'step': '2', 'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト'},
      {'step': '3', 'description': 'HowToテキストHowToテキストHowToテキストHowToテキスト'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('料理方法', ''),
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
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        method['description']!,
                        style: const TextStyle(fontSize: 16),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/FlyedSawagani.png',
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

  Widget _buildTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('コツ・ポイント', ''),
        const SizedBox(height: 16),
        const Text(
          'コツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキストコツテキスト',
        ),
      ],
    );
  }

  Widget _buildEatReportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('食レポ', ''),
        const SizedBox(height: 16),
        const Text('感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト感想テキスト'),
      ],
    );
  }

  Widget _buildAICommentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('AIの補足コメント', ''),
        const SizedBox(height: 16),
        const Text('コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント'),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.red2,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.error,
                size: 20,
                color: AppColors.red1,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'AI補足コメントは、参考情報として提供されるものであり正確性や最新性を保証するものではありません。',
                  style: TextStyle(fontSize: 14, color: AppColors.gray1),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title, String subtitle) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.gray1,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
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
