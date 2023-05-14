import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';

class TutorialPageView extends ConsumerWidget {
  final PageController pageController;
  const TutorialPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: pageController,
      children: [
        const Center(
          child: Text(
            'チュートリアル1',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        const Center(
          child: Text(
            'チュートリアル2',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActionButton(
              onPressed: () {
                // チュートリアル完了後にログイン画面に遷移
                Navigator.pushReplacementNamed(context, '/auth/sign-up');
              },
              text: '新規会員登録',
            ),
          ],
        ),
      ],
    );
  }
}
