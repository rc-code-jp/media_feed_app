import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
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
        ref.read(feedProvider.notifier).toggleVideoById(feedItem.id);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          // プレイヤー
          MediaPlayer(videoController: feedItem.videoController!),

          // 停止表示
          feedItem.isPlayingVideo()
              ? Container()
              : const Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.7,
                    child: Icon(
                      Icons.pause,
                      size: 50,
                      color: AppColors.white,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
