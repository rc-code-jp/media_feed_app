import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedProvider);
    final controller = PageController(initialPage: 0);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
        ),
        body: PageView(
            controller: controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              final title = 'title${feed.length + 1}';
              ref
                  .read(feedProvider.notifier)
                  .addItem(FeedItem(id: title, title: title, url: ''));
            },
            children: [
              for (final item in feed)
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      item.title,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                )
            ]));
  }
}
