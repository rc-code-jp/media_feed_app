import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';
import 'package:media_feed_app/screens/main_screen.dart';
import 'package:media_feed_app/screens/sign_in_screen.dart';
import 'package:media_feed_app/screens/tutorial_screen.dart';
import 'package:media_feed_app/styles/colors.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<bool> isLoggedIn() async {
    return await AuthStorage().has();
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
              primarySwatch: Colors.brown,
            ),
            routes: {
              // ※ '/' スラッシュのみのルートは不要（homeで指定しているため）
              '/main': (context) => const MainScreen(),
              '/tutorial': (context) => const TutorialScreen(),
              '/sign-in': (context) => const SignInScreen(),
            },
            home: loggedIn ? const MainScreen() : const TutorialScreen(),
          );
        }
      },
    );
  }
}
