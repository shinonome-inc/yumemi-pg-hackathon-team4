# ARCHITECTURE

## ディレクトリ構成

```text
client
├─ assets
│  ├─ fonts         # フォントファイルを格納
│  └─ images        # 画像ファイルを格納
└─ lib
   ├─ components    # 各画面共通の UI コンポーネントを定義
   ├─ constants     # 定数クラスを定義
   ├─ enums         # 列挙型を定義
   ├─ extensions    # extension を定義
   ├─ models        # modelを定義
   ├─ pages         # 各画面ごとのディレクトリをまとめる
   │  ├─xxx         # 各画面のディレクトリ
   ├─ providers     # provider を定義
   ├─ repository    # APIやDB等とデータのやり取りを行う repository を定義
   ├─ services      # サービスクラスを定義
   └─ utils         # その他ユーティリティクラスを定義
```
