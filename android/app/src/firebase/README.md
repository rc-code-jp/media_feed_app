jsonのファイル名は環境設定dart_definesを参照

```java
// android/app/build.gradle
// apply pluginのの前あたり

task selectGoogleServicesJson(type: Copy) {
    from "src/firebase/$googleServiceJSON"
    into './'
    rename "$googleServiceJSON", 'google-services.json'
}

tasks.whenTaskAdded { task ->
    if (task.name == 'processDebugGoogleServices' || task.name == 'processReleaseGoogleServices') {
        task.dependsOn selectGoogleServicesJson
    }
}
```