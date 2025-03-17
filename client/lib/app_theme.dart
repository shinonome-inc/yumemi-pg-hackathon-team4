import 'package:client/constants/app_colors.dart';
import 'package:client/constants/font_families.dart';
import 'package:flutter/material.dart';

/// アプリ内共通のThemeを定義。
ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green1),
    fontFamily: FontFamilies.notoSansJP,
  );
}
