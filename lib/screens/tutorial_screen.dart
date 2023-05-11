import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/tutorial/widgets/tutorial_actions.dart';
import 'package:media_feed_app/features/tutorial/widgets/tutorial_page_view.dart';
import 'package:media_feed_app/styles/utils.dart';

class TutorialScreen extends ConsumerStatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  TutorialScreenState createState() => TutorialScreenState();
}

class TutorialScreenState extends ConsumerState<TutorialScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // ページコントローラのページ遷移を監視しページ数を丸める
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: UtilStyles.decorationGradient,
        child: Stack(
          children: [
            TutorialPageView(
              pageController: _pageController,
            ),
            // ページインジケーターとスキップボタン
            TutorialActions(
              onBack: () {
                if (_currentPage == 0) {
                  // スタートページへ
                  Navigator.pop(
                    context,
                  );
                } else {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }
              },
              onForward: _currentPage < 2
                  ? () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
