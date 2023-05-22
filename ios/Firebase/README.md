1. Build phases -> New run script を選択して新しい Run Script を追加
1. 名前をわかりやすいように Select GoogleService-Info.plist に変更
1. スクリプトを記述
1. Output Files に $(SRCROOT)/GoogleService-Info.plist を追加
1. 既存Scriptである Copy Bundle Resources より上に移動

```
\cp -f ${SRCROOT}/Firebase/${googleServicePList} ${SRCROOT}/GoogleService-Info.plist
```

> 実際には、スクリプトによってコピーされた GoogleService-Info.plist が使用されることになるのですが、このままでは ${SRCROOT}/GoogleService-Info.plist ファイルへの参照がなくXcodeで認識できません。
> Xcode上でRunner直下へ GoogleService-Info.plist ファイル（どの環境のものでも良い）をドラッグ＆ドロップで追加してファイルと参照を追加しましょう。