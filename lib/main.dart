import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/app_router.dart';
import 'package:media_feed_app/firebase_options_prd.dart' as fb_option_prd;
import 'package:media_feed_app/firebase_options_stg.dart' as fb_option_stg;
import 'package:media_feed_app/libraries/logger.dart';
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

  // FCM の通知権限リクエスト
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

  // スプラッシュを消す
  FlutterNativeSplash.remove();

  // 起動
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = String.fromEnvironment('appName');
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: title,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
