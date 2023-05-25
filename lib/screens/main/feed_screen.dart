import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/features/feed/providers/feed_provider.dart';
import 'package:vuuum_app/features/feed/widgets/feed_card.dart';
import 'package:vuuum_app/libraries/logger.dart';
import 'package:vuuum_app/styles/colors.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // データ取得
      await fetchData();
      // スプラッシュを消す
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // データを取得
  Future<void> fetchData() async {
    try {
      await ref.read(feedProvider.notifier).fetchFirstItems();
      await ref.read(feedProvider.notifier).changeVideo(0);
      await ref.read(feedProvider.notifier).loadVideo(1);
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
        // 再生
        await ref.read(feedProvider.notifier).changeVideo(index);
        await ref.read(feedProvider.notifier).loadVideo(index + 1);

        // 次のフィードを読み込む
        if (index == feed.length - 1) {
          await ref.read(feedProvider.notifier).fetchNextItems();
          await ref.read(feedProvider.notifier).loadVideo(index + 1);
        }
      },
      itemBuilder: (context, index) {
        return FeedCard(feedItem: feed[index]);
      },
    );
  }
}
