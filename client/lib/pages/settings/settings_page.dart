import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white, // 白背景
        title: Text(
          '設定',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.menu, color: AppColors.gray1), // ハンバーガーメニューアイコン
          onPressed: () {
            // ハンバーガーメニューのアクション
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8), // アイコンの周りに8pxの余白
            child: Container(
              padding: const EdgeInsets.all(8), // アイコン自体のパディング
              child: const Icon(
                Icons.account_circle, // ユーザーアイコン
                size: 24, // アイコンの大きさ
                color: Colors.black, // アイコンの色
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.background, // 背景色を灰色に
        child: Column(
          children: [
            Column(
              children: [
                // アプリ情報の上に32pxの余白を追加
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
                        size: 24, // 注意アイコンの大きさ
                      ),
                      const SizedBox(width: 8), // アイコンとテキストの間にスペース
                      Text(
                        'アプリ情報',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16), // 利用規約と間にスペースを追加

                ListTile(
                  title: Text(
                    '利用規約',
                    style: context.textTheme.bodyMedium,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ), // パディングの設定
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24, // 矢印アイコンの大きさ
                  ),
                  onTap: () {
                    // 利用規約画面に遷移
                  },
                ),
                ListTile(
                  title: Text(
                    'プライバシーポリシー',
                    style: context.textTheme.bodyMedium,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ), // パディングの設定
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24, // 矢印アイコンの大きさ
                  ),
                  onTap: () {
                    // プライバシーポリシー画面に遷移
                  },
                ),
                // アプリバージョンのListTile
                ListTile(
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 24,
                  ), // 上下8px、左右16px（右24px）のパディング
                  title: Text(
                    'アプリバージョン',
                    style: context.textTheme.bodyMedium,
                  ),
                  trailing: Text(
                    'v.1.0.0', // 右端に表示されるアプリバージョン
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40), // アプリ情報とログアウト間に16pxの余白を追加
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ), // 上に32pxの余白
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 24, // 注意アイコンの大きさ
                      ),
                      const SizedBox(width: 8), // アイコンとテキストの間にスペース
                      Text(
                        'アカウント',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16), // 利用規約と間にスペースを追加

                ListTile(
                  title: Text(
                    'ログアウト',
                    style: context.textTheme.bodyMedium,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ), // パディングの設定
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24, // 矢印アイコンの大きさ
                  ),
                  onTap: () {
                    // 利用規約画面に遷移
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
