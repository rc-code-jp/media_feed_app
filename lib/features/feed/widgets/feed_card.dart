import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_detail.dart';
import 'package:media_feed_app/features/feed/widgets/feed_card_progress.dart';
import 'package:media_feed_app/widgets/media_player.dart';

class FeedCard extends ConsumerStatefulWidget {
  // 動画URL
  final FeedItem feedItem;

  const FeedCard({Key? key, required this.feedItem}) : super(key: key);

  @override
  FeedCardState createState() => FeedCardState();
}

class FeedCardState extends ConsumerState<FeedCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 動画部分
        MediaPlayer(
            mediaUrl: widget.feedItem.url,
            initializedCallbackHandler: () {
              // 初期化完了時のコールバック
              print('init');
            }),
        // タイトルなど
        Positioned(
            bottom: 100,
            left: 10,
            child: FeedCardDetail(
              feedItem: widget.feedItem,
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
