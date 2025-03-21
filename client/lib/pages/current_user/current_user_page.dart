import 'package:client/enums/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CurrentUserPage extends ConsumerStatefulWidget {
  const CurrentUserPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<CurrentUserPage> {
  void _onTapSettings() {
    context.push(AppPage.settings.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: _onTapSettings,
            child: const Text('設定画面へ遷移'),
          ),
        ),
      ),
    );
  }
}
