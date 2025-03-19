import 'package:client/constants/app_colors.dart';
import 'package:client/constants/font_families.dart';
import 'package:flutter/material.dart';

// アプリ内共通のThemeを定義。
ThemeData appTheme() {
  return ThemeData(
    fontFamily: FontFamilies.notoSansJP,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green1),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.gray1, // 文字色（本文）
          displayColor: AppColors.gray1, // 文字色（見出しなど）
        ),
  );
}
