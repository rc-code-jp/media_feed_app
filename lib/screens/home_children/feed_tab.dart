import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card.dart';

class FeedTab extends ConsumerStatefulWidget {
  const FeedTab({Key? key}) : super(key: key);

  @override
  FeedTabState createState() => FeedTabState();
}

class FeedTabState extends ConsumerState<FeedTab> {
  final _pageController = PageController(initialPage: 0, viewportFraction: 1.0);
  int _prevItemIndex = 0;

  @override
  void initState() {
    super.initState();

    loadFirstVideo();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 最初の動画を読み込む
  Future<void> loadFirstVideo() async {
    await ref.read(feedProvider.notifier).loadVideo(0);
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(feedProvider);

    return PageView.builder(
      itemCount: feed.length,
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) async {
        // 前回の動画を破棄
        feed[_prevItemIndex].pauseVideo();
        _prevItemIndex = index;

        // 次のフィードを読み込む
        if (index == feed.length - 1) {
          await ref.read(feedProvider.notifier).fetchNextItems();
        }

        // 再生
        await ref.read(feedProvider.notifier).loadVideo(index);
      },
      itemBuilder: (context, index) {
        return FeedCard(feedItem: feed[index]);
      },
    );
  }
}
