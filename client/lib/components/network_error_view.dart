import 'package:client/components/base_error_view_component.dart';
import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorMessageView(
      imagePath: 'assets/images/Scorpion.svg',
      title: 'ネットワークエラー',
      message: 'ネットワーク環境の良い場所で\n再度再読み込みを行ってください。',
      buttonText: '再読み込み',
      onPressed: () {
        // 再読み込み処理を書く
      },
    );
  }
}
