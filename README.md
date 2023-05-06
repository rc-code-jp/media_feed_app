# media_feed_app

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

## ページ構成

Updated at: 2023/05/07.

screens ディレクトリ直下の画面のみ main.dart にルート取りて登録する。
（それ以外は Scaffold を持たないため、ルートに登録しない）

```
/lib/screens
├── tutorial_screen ... チュートリアル
├── start_screen    ... 未ログインでアプリ起動時
├── sign_in_screen  ... ログイン
├── sign_up_screen  ... 新規会員登録
├── main_screen     ... ログイン状態のメイン
│   ├── home_screen   ... ホーム（タブのみ）
│   │   ├── dashboard_screen ... レポートなど
│   │   └── feed_screen      ... 動画フィード
│   ├── news_screens    ... お知らせ
│   └── account_screens ... アカウント設定
└── .
```
