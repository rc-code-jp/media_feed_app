import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card.dart';
import 'package:media_feed_app/styles/colors.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  FeedScreenState createState() => FeedScreenState();
}

class FeedScreenState extends ConsumerState<FeedScreen> {
  final pageController = PageController(initialPage: 0, viewportFraction: 1.0);
  int prevItemIndex = 0;

  @override
  void initState() {
    super.initState();

    loadFirstVideo();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // 最初の動画を読み込む
  Future<void> loadFirstVideo() async {
    await ref.read(feedProvider.notifier).loadVideo(0);
    await ref.read(feedProvider.notifier).playVideo(0);
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(feedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            size: 30,
            color: AppColors.white,
          ),
          onPressed: () {
            // 戻る前に動画を停止
            ref.read(feedProvider.notifier).pauseVideo(prevItemIndex);
            context.go('/');
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        itemCount: feed.length,
        controller: pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) async {
          // 前回の動画を破棄
          ref.read(feedProvider.notifier).pauseVideo(prevItemIndex);
          prevItemIndex = index;

          // 次のフィードを読み込む
          if (index == feed.length - 1) {
            await ref.read(feedProvider.notifier).fetchNextItems();
          }

          // 再生
          await ref.read(feedProvider.notifier).loadVideo(index);
          await ref.read(feedProvider.notifier).playVideo(index);
        },
        itemBuilder: (context, index) {
          return FeedCard(feedItem: feed[index]);
        },
      ),
    );
  }
}
