import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/widgets/feed_acquired_banner.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_actions.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_detail.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_progress.dart';
import 'package:media_feed_app/features/feed/widgets/feed_finished_banner.dart';
import 'package:media_feed_app/features/feed/widgets/feed_media_player.dart';

class FeedCard extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCard({Key? key, required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 動画
        FeedMediaPlayer(
          feedItem: feedItem,
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
          feedItem: feedItem,
        ),

        // 視聴完了時のバナー
        FeedFinishedBanner(
          feedItem: feedItem,
        ),

        // 獲得完了時のバナー
        FeedAcquiredBanner(
          feedItem: feedItem,
        ),
      ],
    );
  }
}
