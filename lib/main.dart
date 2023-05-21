import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';
import 'package:media_feed_app/routes.dart';
import 'package:media_feed_app/screens/main/main_screen.dart';
import 'package:media_feed_app/screens/start/start_screen.dart';
import 'package:media_feed_app/styles/colors.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // スプラッシュを自動で消さないようにする
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Firebase初期化
  // final fb = AppFirebase();
  // await fb.initialize();

  // 通知許可
  // await fb.requestFcmPermission();

  // 起動
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // ログインチェック
  Future<bool> checkLoggedIn() async {
    final hasToken = await AuthStorage().has();
    // 1秒待つ
    await Future.delayed(const Duration(seconds: 1));
    // スプラッシュを消す
    FlutterNativeSplash.remove();
    return hasToken;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = String.fromEnvironment('appName');

    return MaterialApp(
      title: title,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      routes: routes,
      // ログイン状態に応じて表示する画面を切り替える
      home: FutureBuilder(
        future: checkLoggedIn(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            );
          }
          bool loggedIn = snapshot.data!;
          return loggedIn ? const MainScreen() : const StartScreen();
        },
      ),
    );
  }
}
