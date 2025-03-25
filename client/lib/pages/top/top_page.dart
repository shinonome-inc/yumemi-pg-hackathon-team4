import 'package:client/constants/app_colors.dart';
import 'package:client/enums/app_page.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/pages/top/top_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class TopPage extends ConsumerStatefulWidget {
  const TopPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _onTapSignInWithEmail() async {
    final notifier = ref.read(topNotifierProvider.notifier);
    try {
      await notifier.signInWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on Exception {
      // TODO: エラーの際の処理を追加する。
      return;
    }
    await context.push(AppPage.recipeList.path);
  }

  Future<void> _onTapSignInWithGoogle() async {
    final notifier = ref.read(topNotifierProvider.notifier);
    try {
      await notifier.signInWithGoogle();
    } on Exception {
      // TODO: エラーの際の処理を追加する。
      return;
    }
    await context.push(AppPage.recipeList.path);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(topNotifierProvider);
    final notifier = ref.read(topNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.background,
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

            // ログインフォーム
            Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 360,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/CookWildLogo.svg',
                            width: 40,
                          ),
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
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'メールアドレス',
                          border: OutlineInputBorder(),
                          hintText: 'example@email.com',
                          hintStyle: TextStyle(
                            color: AppColors.gray2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _passwordController,
                        obscureText: state.isObscurePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            // 文字の表示・非表示でアイコンを変える
                            icon: Icon(
                              state.isObscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.gray2,
                            ),
                            // アイコンがタップされたら現在と反対の状態をセットする
                            onPressed: notifier.toggleIsObscurePassword,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'パスワード',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: FilledButton(
                          onPressed: _onTapSignInWithEmail,
                          child: const Text('ログイン'),
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
                          onPressed: _onTapSignInWithGoogle,
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
                                  'Googleでログイン',
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
                            context.push(AppPage.signUp.path);
                          },
                          child: const Text(
                            '新規登録はこちら',
                            style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
