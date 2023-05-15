import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';
import 'package:media_feed_app/widgets/version_text.dart';

@RoutePage()
class StartScreen extends ConsumerWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
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
      ),
    );
  }
}
