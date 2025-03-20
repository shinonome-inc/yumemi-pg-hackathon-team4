import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final package = AppInfo.of(context).package;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          '設定',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.gray1),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.account_circle,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ), // 上に32pxの余白
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'アプリ情報',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(
                    '利用規約',
                    style: context.textTheme.bodyMedium,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'プライバシーポリシー',
                    style: context.textTheme.bodyMedium,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 24,
                  ),
                  title: Text(
                    'アプリバージョン',
                    style: context.textTheme.bodyMedium,
                  ),
                  trailing: Text(
                    'v.${package.versionWithoutBuild}',
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'アカウント',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(
                    'ログアウト',
                    style: context.textTheme.bodyMedium,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
