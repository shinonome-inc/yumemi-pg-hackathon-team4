import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerStatefulWidget {
  const TopPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
  // パスワードの表示・非表示を切り替えるためのフラグ
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 360,
                minHeight: MediaQuery.of(context).size.height,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'クックワイルド',
                        style: context.textTheme.titleLargeBold?.copyWith(
                          color: AppColors.green1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'ログイン',
                    style: context.textTheme.titleLargeBold?.copyWith(
                      color: AppColors.gray1,
                    ),
                  ),
                  const SizedBox(height: 36),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text('メールアドレス'),
                      border: OutlineInputBorder(),
                      hintText: 'example@email.com',
                      hintStyle: TextStyle(
                        color: AppColors.gray2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        // 文字の表示・非表示でアイコンを変える
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.gray2,
                        ),
                        // アイコンがタップされたら現在と反対の状態をセットする
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: const Text('パスワード'),
                      border: const OutlineInputBorder(),
                      hintText: 'password',
                      hintStyle: const TextStyle(
                        color: AppColors.gray2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('ログイン'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.green1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.gray3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'または',
                          style: TextStyle(color: AppColors.gray2),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.gray3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Googleでログイン'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 40,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        '新規登録はこちら',
                        style: TextStyle(
                          color: AppColors.green1,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.green1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
