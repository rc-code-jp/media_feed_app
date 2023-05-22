dev/stg

```
flutterfire configure \
  --out=lib/firebase/firebase_options_stg.dart \
  --platforms=android,ios \
  --ios-bundle-id=god.of.engineer001.stg \
  --android-package-name=god.of.engineer001.stg \
  --no-apply-gradle-plugins \
  --no-app-id-json
```

prd

```
flutterfire configure \
  --out=lib/firebase/firebase_options_prd.dart \
  --platforms=android,ios \
  --ios-bundle-id=god.of.engineer001.prd \
  --android-package-name=god.of.engineer001.prd \
  --no-apply-gradle-plugins \
  --no-app-id-json
```

## 備考

- ios/Runner直下のplistはXCodeで消す。

___