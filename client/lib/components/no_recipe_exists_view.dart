import 'package:client/components/base_error_view_component.dart';
import 'package:flutter/material.dart';

class NoRecipeExistsView extends StatelessWidget {
  const NoRecipeExistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorMessageView(
      imagePath: 'assets/images/Lizard.svg',
      title: 'まだレシピがありません',
      message: 'まだ誰もレシピを投稿していないみたいです。\n記念すべき最初のレシピを投稿するチャンスです！',
      buttonText: 'レシピを投稿する',
      onPressed: () {
        // レシピ作成画面に移動する処理を書く
      },
    );
  }
}
