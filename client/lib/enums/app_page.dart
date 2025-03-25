import 'package:client/pages/current_user/current_user_page.dart';
import 'package:client/pages/privacy_policy_page/privacy_policy_page.dart';
import 'package:client/pages/profile_form/profile_form_page.dart';
import 'package:client/pages/recipe_edit_form.dart/recipe_edit_form_page.dart';
import 'package:client/pages/recipe_form/recipe_form_page.dart';
import 'package:client/pages/recipe_list/recipe_list_page.dart';
import 'package:client/pages/sample/sample_page.dart';
import 'package:client/pages/settings/settings_page.dart';
import 'package:client/pages/sign_up/sign_up_page.dart';
import 'package:client/pages/terms_of_service_page/terms_of_service_page.dart';
import 'package:client/pages/top/top_page.dart';
import 'package:client/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

/// アプリ内の各画面を表すEnum。
enum AppPage {
  /// 認証中ユーザー画面
  currentUser,

  /// トップ画面
  top,

  /// サインアップ画面
  signUp,

  /// 設定画面
  settings,

  /// レシピ一覧画面
  recipeList,

  /// レシピ詳細画面
  recipeDetail,

  /// レシピフォーム画面
  recipeForm,

  /// レシピ編集フォーム画面
  recipeEditForm,

  /// プロフィールフォーム画面
  profileForm,

  /// ユーザー画面
  user,

  /// プライバシーポリシー画面
  privacyPolicy,

  /// 利用規約画面
  termsOfService,

  /// サンプル画面
  /// TODO: 本実装とは関係ないため、Flutter初心者組のキャッチアップ完了後に削除する。
  sample;

  /// 画面のパスを取得する。
  ///
  /// トップ画面の場合は'/'、それ以外の画面は'/画面名'を返す。
  /// パスに含まれる画面名はスネークケースで返される。
  String get path => this == AppPage.top ? '/' : '/${name.snakeCase}';

  /// 画面に対応する `Widget` を取得する。
  Widget? get child {
    switch (this) {
      case AppPage.currentUser:
        return const CurrentUserPage();
      case AppPage.top:
        return const TopPage();
      case AppPage.signUp:
        return const SignUpPage();
      case AppPage.settings:
        return const SettingsPage();
      case AppPage.recipeList:
        return const RecipeListPage();
      case AppPage.recipeDetail:
        return null;
      case AppPage.recipeForm:
        return const RecipeFormPage();
      case AppPage.recipeEditForm:
        return null;
      case AppPage.profileForm:
        return const ProfileFormPage();
      case AppPage.user:
        return const UserPage();
      case AppPage.privacyPolicy:
        return const PrivacyPolicyPage();
      case AppPage.termsOfService:
        return const TermsOfServicePage();
      case AppPage.sample:
        return const SamplePage();
    }
  }
}
