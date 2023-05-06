import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/utils.dart';

class TutorialScreen extends ConsumerStatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  TutorialScreenState createState() => TutorialScreenState();
}

class TutorialScreenState extends ConsumerState<TutorialScreen> {
  final PageController _pageController = PageController(initialPage: 0);
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
        decoration: UtilStyles.boxGradient,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                const Center(child: Text('1')),
                const Center(child: Text('2')),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // チュートリアル完了後にログイン画面に遷移
                        Navigator.pushReplacementNamed(context, '/sign-in');
                      },
                      child: const Text('ログインする'),
                    ),
                  ],
                ),
              ],
            ),
            // ページインジケーターとスキップボタン
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SafeArea(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 戻るボタン
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
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
                        child: const Text('戻る'),
                      ),
                    ),
                    // スキップボタン
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: _currentPage < 2
                            ? () {
                                // 次へ
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              }
                            : null,
                        child: const Text('次へ'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
