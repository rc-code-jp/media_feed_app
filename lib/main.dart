import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/firebase_options_prd.dart' as fb_option_prd;
import 'package:media_feed_app/firebase_options_stg.dart' as fb_option_stg;
import 'package:media_feed_app/libraries/auth_storage.dart';
import 'package:media_feed_app/libraries/logger.dart';
import 'package:media_feed_app/routes.dart';
import 'package:media_feed_app/screens/main/main_screen.dart';
import 'package:media_feed_app/screens/start/start_screen.dart';
import 'package:media_feed_app/styles/colors.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // スプラッシュを自動で消さないようにする
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 環境名確認
  const flavorName = String.fromEnvironment('flavor');
  logger.info('flavorName: $flavorName');

  // Firebaseを初期化
  await Firebase.initializeApp(
    // 本番環境はprd、それ以外はstg
    options: flavorName == 'prd'
        ? fb_option_prd.DefaultFirebaseOptions.currentPlatform
        : fb_option_stg.DefaultFirebaseOptions.currentPlatform,
  );

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
  Future<bool> isLoggedIn() async {
    final hasToken = await AuthStorage().has();
    // ダミーで1秒待つ
    await Future.delayed(const Duration(milliseconds: 500));
    // スプラッシュを消す
    FlutterNativeSplash.remove();

    // // FCM の通知権限リクエスト
    final messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return hasToken;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'Media Feed App';

    return FutureBuilder<bool>(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          // ログイン状態の取得が完了するまでローディング表示を行う
          return const MaterialApp(
            title: title,
            home: Scaffold(
              backgroundColor: AppColors.primary,
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ),
            ),
          );
        } else {
          bool loggedIn = snapshot.data!;

          // ログイン状態に応じて表示する画面を切り替える
          return MaterialApp(
            title: title,
            themeMode: ThemeMode.light,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
            ),
            routes: routes,
            home: loggedIn ? const MainScreen() : const StartScreen(),
          );
        }
      },
    );
  }
}
