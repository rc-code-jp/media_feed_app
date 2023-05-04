import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/widgets/media_player.dart';

class FeedMediaPlayer extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedMediaPlayer({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        feedItem.toggleVideo();
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          // プレイヤー
          MediaPlayer(
            videoController: feedItem.videoController,
          ),
        ],
      ),
    );
  }
}
