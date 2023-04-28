import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card.dart';

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

    // 最初の動画を再生
    ref.read(feedProvider.notifier).playVideo(0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(feedProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.navigate_before,
              size: 30,
            ),
            onPressed: () {
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

            print(prevItemIndex);

            prevItemIndex = index;

            // 再生
            await ref.read(feedProvider.notifier).playVideo(index);
          },
          itemBuilder: (context, index) {
            return FeedCard(feedItem: feed[index]);
          },
        ));
  }
}
