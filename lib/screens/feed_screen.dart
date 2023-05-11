import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card.dart';
import 'package:media_feed_app/libraries/logger.dart';
import 'package:media_feed_app/styles/colors.dart';

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

    // build後にデータを取得
    // FIXME: もっと良い方法があるはず
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      await _fetchData();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // データを取得
  Future<void> _fetchData() async {
    try {
      await ref.read(feedProvider.notifier).fetchFirstItems();
      await ref.read(feedProvider.notifier).changeVideo(0);
    } catch (e) {
      logger.info(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(feedProvider);

    if (feed.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.white,
        ),
      );
    }

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
