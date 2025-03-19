import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background, // 背景色をAppColors.backgroundに設定
      padding: const EdgeInsets.symmetric(horizontal: 16), // 左右に余白を設定
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Scorpion.svg', // 適切なファイルパスを指定
                ),
                const SizedBox(height: 32), // SVG画像とテキストの間に32pxの余白
                Container(
                  child: Column(
                    children: [
                      Text(
                        'ネットワークエラー',
                        style: context.textTheme.bodyLargeBold,
                      ),
                      const SizedBox(height: 8), // 8pxの余白
                      Text(
                        'ネットワーク環境の良い場所で\n再度再読み込みを行ってください。',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 64), // ボタンと画面下の間に64pxの余白
            child: ElevatedButton(
              onPressed: () {}, // ボタンの機能は未実装
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green1,
                minimumSize: const Size(double.infinity, 50), // ボタンの幅を画面いっぱいに
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ), // 上下に10pxのパディングを指定
              ),
              child: Text(
                '再読み込み',
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
