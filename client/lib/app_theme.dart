import 'package:client/constants/font_families.dart';
import 'package:flutter/material.dart';

/// アプリ内共通のThemeを定義。
ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    fontFamily: FontFamilies.notoSansJP,
  );
}
