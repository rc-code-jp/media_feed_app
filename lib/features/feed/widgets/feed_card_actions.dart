import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/styles/colors.dart';

class FeedCardActions extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCardActions({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 30.0;

    return Positioned(
      bottom: 100,
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
              color: AppColors.white,
              size: iconSize,
            ),
          ),

          // 情報ボタン
          IconButton(
            onPressed: () {
              // TODO: 情報を見る
            },
            icon: const Icon(
              Icons.info_outline,
              color: AppColors.white,
              size: iconSize,
            ),
          ),

          // いいねボタン
          IconButton(
            constraints: const BoxConstraints(), // 余白を消す
            onPressed: () {
              ref.read(feedProvider.notifier).toggleFavoriteById(feedItem.id);
            },
            icon: feedItem.isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: AppColors.pink,
                    size: 30,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: AppColors.white,
                    size: iconSize,
                  ),
          ),
        ],
      ),
    );
  }
}
