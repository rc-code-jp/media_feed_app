plistのファイル名は環境設定dart_definesを参照

1. Build phases -> New run script を選択して新しい Run Script を追加
1. 名前をわかりやすいように Select GoogleService-Info.plist に変更
1. スクリプトを記述
1. Output Files に $(SRCROOT)/GoogleService-Info.plist を追加
1. 既存Scriptである Copy Bundle Resources より上に移動

```
\cp -f ${SRCROOT}/Firebase/${googleServicePList} ${SRCROOT}/GoogleService-Info.plist
```
