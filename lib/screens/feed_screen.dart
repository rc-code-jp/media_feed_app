import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  FeedScreenState createState() => FeedScreenState();
}

class FeedScreenState extends ConsumerState<FeedScreen> {
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );

  @override
  void initState() {
    super.initState();

    // 最初の動画を読み込む
    ref.read(feedProvider.notifier).changeVideo(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(feedProvider);

    return PageView.builder(
      itemCount: feed.length,
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) async {
        // 次のフィードを読み込む
        if (index == feed.length - 1) {
          await ref.read(feedProvider.notifier).fetchNextItems();
        }

        // 再生
        await ref.read(feedProvider.notifier).changeVideo(index);
      },
      itemBuilder: (context, index) {
        return FeedCard(feedItem: feed[index]);
      },
    );
  }
}
