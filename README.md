# media_feed_app

## 初期設定

Flutter/Dart のバージョン管理に fvm を使用する。

https://fvm.app/docs/getting_started/installation

次のコマンドで環境の確認を行う。

```
fvm flutter doctor
```

## 起動

起動は VSCode で行うため省略。

## 構造

```
/
├──
├── lib
│   ├── providers ... グローバルな状態管理
│   ├── router    ... ルーター関連
│   ├── screens   ... スクリーン（ページ）
│   ├── widgets   ... 共通コンポーネント
│   ├── libraries ... ライブラリの初期化やラッパーなど
│   ├── features
│   │   ├── xxxx  ... usersなどの機能名ディレクトリを切る
│   │   │   ├── models    ... モデル
│   │   │   ├── providers ... 状態管理
│   │   │   └── widgets   ... コンポーネント
│   │   └── .
│   └── .
└── .
```
