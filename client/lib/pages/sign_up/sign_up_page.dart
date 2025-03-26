import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<SignUpPage> {
  // パスワードの表示・非表示を切り替えるためのフラグ
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // 背景のイラスト
            Positioned(
              bottom: -16,
              left: -60,
              child: SvgPicture.asset(
                'assets/images/Lizard.svg',
                width: 220,
              ),
            ),
            Positioned(
              bottom: -36,
              right: -140,
              child: SvgPicture.asset(
                'assets/images/Snake.svg',
                width: 260,
              ),
            ),

            Center(
              child: Transform.translate(
                offset: const Offset(0, -56),
                child: SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 360,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 48),
                        Text(
                          '新規登録',
                          style: context.textTheme.titleLargeBold,
                        ),
                        const SizedBox(height: 36),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '表示名',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'ゲテモノ好き',
                            hintStyle: TextStyle(
                              color: AppColors.gray2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'メールアドレス',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.gray2,
                              ),
                              // アイコンがタップされたら現在と反対の状態をセットする
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'パスワード',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: FilledButton(
                            onPressed: () {},
                            child: const Text('新規登録'),
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/google_logo.svg',
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Googleで続ける',
                                    style: context.textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text(
                              'ログインはこちら',
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
          ],
        ),
      ),
    );
  }
}
