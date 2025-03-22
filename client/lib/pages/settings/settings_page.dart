import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final package = AppInfo.of(context).package;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('設定', style: context.textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.gray1),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              // アイコンがタップされたときの処理
            },
            icon: SvgPicture.asset(
              'assets/images/userIcon.svg',
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            padding: const EdgeInsets.all(8),
            splashRadius: 24,
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // メイン内容
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    _sectionTitle(context, Icons.info_outline, 'アプリ情報'),
                    _settingItem(context, '利用規約', onTap: () {}),
                    _settingItem(context, 'プライバシーポリシー', onTap: () {}),
                    _settingItem(
                      context,
                      'アプリバージョン',
                      trailing: Text(
                        'v.${package.versionWithoutBuild}',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _sectionTitle(context, Icons.person_outline, 'アカウント'),
                    _settingItem(context, 'ログアウト', onTap: () {}),
                  ],
                ),
              ),
            ),

            // 背景イラスト：左下
            Positioned(
              bottom: 70,
              left: -40,
              child: SvgPicture.asset(
                'assets/images/AlligatorOnTree.svg',
                width: 270,
              ),
            ),

            // 背景イラスト：右下
            Positioned(
              bottom: -20,
              right: -115,
              child: SvgPicture.asset(
                'assets/images/Snake.svg',
                width: 270,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 8),
          Text(title, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _settingItem(BuildContext context, String title,
      {Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      title: Text(title, style: context.textTheme.bodyMedium),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 24),
      onTap: onTap,
    );
  }
}
