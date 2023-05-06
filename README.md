# media_feed_app

## パッケージ

- [riverpod](https://docs-v2.riverpod.dev/docs/getting_started)

## 初期設定

### PC にインストールが必要なもの

- [FVM](https://fvm.app/docs/getting_started/installation)
- [lefthook](https://github.com/evilmartians/lefthook#usage)
  - `brew install lefthook`
- ...

### lifthook の登録

```
lefthook install
```

### Flutter 環境の確認

```
fvm flutter doctor
```

## 起動

起動は VSCode で行うため省略。

## 構造

```
/
├── ios
├── android
├── assets        ... 共通資産
├── lib
│   ├── providers ... グローバルな状態管理
│   ├── widgets   ... 共通コンポーネント
│   ├── libraries ... ライブラリの初期化やラッパーなど
│   ├── screens   ... スクリーン（ページ）
│   ├── styles    ... 共通スタイル
│   ├── features
│   │   ├── xxxx  ... usersなどの機能名ディレクトリを切る
│   │   │   ├── models    ... モデル
│   │   │   ├── providers ... 状態管理
│   │   │   └── widgets   ... コンポーネント
│   │   └── .
│   └── .
└── .
```
