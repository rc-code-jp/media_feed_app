import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';
import 'package:media_feed_app/libraries/logger.dart';
import 'package:media_feed_app/screens/main_screen.dart';
import 'package:media_feed_app/screens/news_screen.dart';
import 'package:media_feed_app/screens/play_history_screen.dart';
import 'package:media_feed_app/screens/point_screen.dart';
import 'package:media_feed_app/screens/setting_screen.dart';
import 'package:media_feed_app/screens/sign_in_screen.dart';
import 'package:media_feed_app/screens/sign_up_screen.dart';
import 'package:media_feed_app/screens/start_screen.dart';
import 'package:media_feed_app/screens/tutorial_screen.dart';
import 'package:media_feed_app/styles/colors.dart';

void main() {
  const flavorName = String.fromEnvironment('flavor');
  logger.info('flavorName: $flavorName');

  // スプラッシュを自動で消さないようにする
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
        if (snapshot.connectionState == ConnectionState.waiting) {
          // ログイン状態の取得が完了するまでローディング表示を行う
          return const MaterialApp(
            title: title,
            home: Scaffold(
              backgroundColor: AppColors.black,
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
              primarySwatch: Colors.red,
            ),
            routes: {
              // ※ '/' スラッシュのみのルートはhomeで指定しているため不要
              // ここに書くのはScaffoldを返すルートのみ
              '/main': (context) => const MainScreen(),
              '/start': (context) => const StartScreen(),
              '/tutorial': (context) => const TutorialScreen(),
              '/sign-in': (context) => const SignInScreen(),
              '/sign-up': (context) => const SignUpScreen(),
              '/play-history': (context) => const PlayHistoryScreen(),
              '/news': (context) => const NewsScreen(),
              '/point': (context) => const PointScreen(),
              '/setting': (context) => const SettingScreen(),
            },
            home: loggedIn ? const MainScreen() : const StartScreen(),
          );
        }
      },
    );
  }
}
