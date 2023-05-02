import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_actions.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_detail.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_progress.dart';
import 'package:media_feed_app/features/feed/widgets/finished_banner.dart';
import 'package:media_feed_app/widgets/media_player.dart';

class FeedCard extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCard({Key? key, required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        // 動画
        MediaPlayer(
          videoController: feedItem.videoController,
        ),

        // タイトルなど
        FeedCardDetail(
          feedItem: feedItem,
        ),

        // いいねボタンなど
        FeedCardActions(
          feedItem: feedItem,
        ),

        // 進捗
        FeedCardProgress(
          finishedCallbackHandler: () {
            // 終了時のコールバック
            ref.read(feedProvider.notifier).completeItemById(feedItem.id);
          },
        ),

        // コード出現
        FinishedBanner(
          feedItem: feedItem,
        ),
      ],
    );
  }
}
