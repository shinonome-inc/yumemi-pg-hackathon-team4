# GET STARTED

## Flutter バージョン

Flutter 3.27.1

## FVM

FVM を使用する場合は flutter コマンドの前に fvm をつけて下さい。
例）

```
fvm flutter --version
```

## Git 管理外の秘匿ファイルの追加

秘匿情報を含んだファイルは Git の管理下から外しています。
Google ドライブから秘匿ファイルをダウンロードし、以下の表を参考に追加を行って下さい。

| ファイル                       | パス                                |
| ------------------------------ | ----------------------------------- |
| **`.env`**                     | .env                                |
| **`google-services.json`**     | android/app/google-services.json    |
| **`GoogleService-Info.plist`** | ios/Runner/GoogleService-Info.plist |
| **`firebase_options.dart`**    | lib/firebase_options.dart           |

※開発メンバーで Google ドライブのアクセス権限がない場合や場所がわからない場合は [@KobayashiYoh](https://github.com/KobayashiYoh) までご連絡下さい。

## 依存関係のインストール

以下のコマンドを実行して依存関係のインストールを行います。
pubspec.lock は Git の差分から外しています。

```
fvm flutter pub get
```

## build_runner の実行

以下のコマンドを実行して.freezed.dart と.g.dart のファイルを build*runner で生成します。
*.freezed.dart と\_.g.dart は Git の差分から外しています。

```
fvm dart run build_runner build --delete-conflicting-outputs
```

## Flutter プロジェクトの実行

以下のコマンドを実行（または IDE の GUI から実行を選択）して Flutter プロジェクトを実行します。

```
fvm flutter run
```
