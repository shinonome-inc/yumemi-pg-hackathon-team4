# GET STARTED

## Flutter バージョン

Flutter 3.27.1

## FVM

FVM を使用する場合は flutter コマンドの前に fvm をつけて下さい。
例）

```
fvm flutter --version
```

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
