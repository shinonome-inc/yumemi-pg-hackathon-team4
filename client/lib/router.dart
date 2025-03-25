import 'package:client/components/layout_sccafold.dart';
import 'package:client/enums/app_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _bottomNavigationPages = <AppPage>[
  AppPage.recipeList,
  AppPage.recipeForm,
  AppPage.currentUser,
];

/// プロジェクトの画面遷移に関するルーティング設定。
///
/// ルーティングする画面の追加・削除・変更を行う場合は、列挙型`AppPage`を変更する。
final router = GoRouter(
  // TODO: initialLocationはAppPage.top.pathに変更する。
  initialLocation: AppPage.privacyPolicy.path,
  routes: [
    // BottomNavigationBar用のルーティング
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => LayoutScaffold(
        navigationShell: navigationShell,
      ),
      branches: [
        for (final branch in _bottomNavigationPages)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: branch.path,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: branch.child,
                ),
              ),
            ],
          ),
      ],
    ),
    // 全画面のルーティング
    for (final page in AppPage.values)
      GoRoute(
        path: page.path,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: page.child,
          );
        },
      ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
