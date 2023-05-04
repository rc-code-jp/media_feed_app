import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:video_player/video_player.dart';

class MediaPlayer extends StatelessWidget {
  // 動画URL
  VideoPlayerController? videoController;

  MediaPlayer({Key? key, this.videoController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
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

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: videoController?.value.size.width ?? 0,
          height: videoController?.value.size.height ?? 0,
          child: VideoPlayer(videoController!),
        ),
      ),
    );
  }
}
