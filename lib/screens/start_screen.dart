import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';
import 'package:media_feed_app/widgets/version_text.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: UtilStyles.boxGradient,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // チュートリアルへ
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tutorial');
                },
                child: const Text('はじめる'),
              ),
              const SizedBox(
                height: 20,
              ),
              // ログインへ
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                child: const Text('アカウントでログイン'),
              ),
              const SizedBox(
                height: 20,
              ),
              // バージョン表示
              const VersionText(
                textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
