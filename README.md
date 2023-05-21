# Vuuum - 動画をスクロールして閲覧するアプリ

## 初期設定

### PC にインストールが必要なもの

`flutter doctor` がすべてクリア状態になっていることが前提。

- [FVM](https://fvm.app/docs/getting_started/installation)
- [lefthook](https://github.com/evilmartians/lefthook#usage)
  - `brew install lefthook`
- ...

### lifthook の登録

```
lefthook install
```

### パッケージインストール

```
fvm flutter pub get
```

## 起動

起動は VSCode の起動コマンドを参照。

> `.vscode/launch.json`

## リリースビルド ios

Automatic manage signing でも大丈夫かも？
（dev,stg,prd分のprofileをimportする必要がある）

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
fvm flutter build apk --release --dart-define-from-file=dart_defines/stg.json
```

```
# 出力フォルダを開く
open ./build/app/outputs/flutter-apk
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

**features間のimportは禁止**

```
/
├── ios
├── android
├── assets        ... 共通資産
├── lib
│   ├── providers ... グローバルな状態管理
│   ├── widgets   ... 共通コンポーネント
│   ├── libraries ... ライブラリの初期化やラッパーなど
│   ├── utils     ... 汎用的な関数などを定義する
│   ├── styles    ... 共通スタイル
│   ├── screens   ... スクリーン（ページ）
│   │   ├── xxx   ... 無法
│   ├── features
│   │   ├── xxx   ... usersなどの機能名ディレクトリを切る
│   │   │   ├── models    ... モデル
│   │   │   ├── providers ... 状態管理
│   │   │   └── widgets   ... コンポーネント
│   │   └── .
│   └── .
└── .
```
