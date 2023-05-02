import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';

class FeedCardActions extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCardActions({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 110,
      right: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // シェアボタン
          IconButton(
            onPressed: () {
              // TODO: シェアする
            },
            icon: const Icon(
              Icons.ios_share,
              color: Colors.white,
              size: 30,
            ),
          ),
          // いいねボタン
          IconButton(
            onPressed: () {
              ref.read(feedProvider.notifier).toggleFavoriteById(feedItem.id);
            },
            icon: feedItem.isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.pinkAccent,
                    size: 30,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
  }
}
