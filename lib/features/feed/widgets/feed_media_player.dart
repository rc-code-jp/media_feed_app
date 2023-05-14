import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/media_player.dart';

class FeedMediaPlayer extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedMediaPlayer({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!feedItem.hasVideoController()) {
      // 動画がない場合はローディングを表示
      return const SizedBox(
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.white,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (feedItem.isPlayingVideo()) {
          feedItem.pauseVideo();
        } else {
          feedItem.playVideo();
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          // プレイヤー
          Container(
            color: AppColors.black,
            child: MediaPlayer(videoController: feedItem.videoController!),
          ),
        ],
      ),
    );
  }
}
