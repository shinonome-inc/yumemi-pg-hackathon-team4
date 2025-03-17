import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoSearchResultView extends StatelessWidget {
  const NoSearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background, // 背景色をAppColors.backgroundに設定
      padding: const EdgeInsets.symmetric(horizontal: 16), // 左右に余白を設定
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Spider.svg', // 適切なファイルパスを指定
                ),
                const SizedBox(height: 32), // SVG画像とテキストの間に32pxの余白
                Container(
                  child: Column(
                    children: [
                      Text(
                        '検索結果 0件',
                        style: context.textTheme.bodyLargeBold,
                      ),
                      const SizedBox(height: 8), // 8pxの余白
                      Text(
                        'レシピが見つかりませんでした。\nキーワードを変えて検索してみて下さい。',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
