import 'package:flutter/material.dart';

/// 利用規約やプライバシーポリシーなどのAppContentを表示するためのView。
class AppContentView extends StatelessWidget {
  const AppContentView({super.key, required this.contentText});

  final String contentText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(contentText),
        ),
      ),
    );
  }
}
