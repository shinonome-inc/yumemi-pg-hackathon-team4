import 'package:client/enums/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<SettingsPage> {
  void _onTapSignOut() {
    // TODO: サインアウトの処理を実装する。
    context.pushReplacement(AppPage.signIn.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定画面'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: _onTapSignOut,
            child: const Text('サインアウト（サインイン画面へ遷移）'),
          ),
        ),
      ),
    );
  }
}
