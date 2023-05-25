import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';
import 'package:vuuum_app/widgets/form/action_button.dart';
import 'package:vuuum_app/widgets/version_text.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({Key? key}) : super(key: key);

  // 初期化
  Future<void> init() async {
    // スプラッシュを消す
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // スプラッシュがあるので何も表示しない
            return Container(
              decoration: UtilStyles.decorationGradient,
              child: const SizedBox.shrink(),
            );
          } else {
            return body(context);
          }
        },
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      decoration: UtilStyles.decorationGradient,
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // 上下にExpandedを置くと間の要素が中央に来る
            const Expanded(child: SizedBox.shrink()),
            // チュートリアルへ
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tutorial');
              },
              text: 'はじめる',
            ),
            const Expanded(child: SizedBox.shrink()),
            // ログインへ
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/auth/sign-in');
              },
              text: 'アカウントでログイン',
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
    );
  }
}
