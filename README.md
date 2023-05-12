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

起動は VSCode の起動コマンドを参照。

> `.vscode/launch.json`

## リリースビルド ios

Automatic manage signing でも大丈夫かも？  
ios/EnvFiles の設定が必要です.

```
# 先にクリーンしておく
fvm flutter clean
```

```
# ios
fvm flutter build ipa --release --dart-define-from-file=dart_defines/stg.json --export-method=ad-hoc
```

```
# 出力フォルダを開く
open ./build/ios/ipa
```

## リリースビルド android

```
# android
fvm flutter build FIXME --release --dart-define-from-file=dart_defines/stg.json
```

## スプラッシュ画面の生成

[flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

```
fvm flutter pub run flutter_native_splash:create
```

## アプリアイコンの生成

[flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

```
fvm flutter pub run flutter_launcher_icons
```

## 構造

**作成するファイルはすべて小文字スネークケース**

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

FIXME: 更新してない

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
