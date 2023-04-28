import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedProvider);
    final controller = PageController(initialPage: 0, viewportFraction: 1.0);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: PageView.builder(
          itemCount: feed.length,
          controller: controller,
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            ref.read(feedProvider.notifier).addItem();
          },
          itemBuilder: (context, index) {
            return FeedCard(feedItem: feed[index]);
          },
        ));
  }
}
