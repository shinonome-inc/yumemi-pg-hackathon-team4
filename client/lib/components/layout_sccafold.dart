import 'package:client/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// GoRouterを用いてBottomNavigationBarのitemを表示するためのWidget。
///
class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  /// 各タブのUIの情報をリスト化
  static const _tabs = [
    (
      filled: Icons.home,
      outlined: Icons.home_outlined,
      label: 'ホーム',
    ),
    (
      filled: Icons.my_library_add,
      outlined: Icons.my_library_add_outlined,
      label: 'レシピ投稿',
    ),
    (
      filled: Icons.person,
      outlined: Icons.person_outline,
      label: 'マイページ',
    ),
  ];

  /// 動的にアイコンを生成する。
  ///
  /// [currentIndex]が選択されているアイテムのindex。
  ///
  /// アイテムが選択されている場合はアイコンをfilledに、選択されていない場合はoutlinedにする。
  List<BottomNavigationBarItem> _buildItems(int currentIndex) {
    return _tabs.map((tab) {
      final isSelected = currentIndex == _tabs.indexOf(tab);
      return BottomNavigationBarItem(
        icon: Icon(isSelected ? tab.filled : tab.outlined),
        label: tab.label,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        items: _buildItems(navigationShell.currentIndex),
      ),
    );
  }
}
