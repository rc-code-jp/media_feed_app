import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_detail.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_progress.dart';
import 'package:media_feed_app/widgets/media_player.dart';

class FeedCard extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCard({Key? key, required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        MediaPlayer(
          videoController: feedItem.videoController,
        ),

        // タイトルなど
        Positioned(
            bottom: 100,
            left: 10,
            child: FeedCardDetail(
              feedItem: feedItem,
            )),
        // 進捗
        Positioned(
          top: 100,
          right: 10,
          child: FeedCardProgress(
            finishedCallbackHandler: () {
              // 終了時のコールバック
              print('finished');
            },
          ),
        )
      ],
    );
  }
}
