import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MediaPlayer extends StatelessWidget {
  // 動画URL
  final VideoPlayerController videoController;

  const MediaPlayer({Key? key, required this.videoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 縦動画フラグ
    final isPortrait =
        videoController.value.size.width < videoController.value.size.height;

    return SizedBox.expand(
      child: FittedBox(
        fit: isPortrait ? BoxFit.cover : BoxFit.contain,
        child: SizedBox(
          width: videoController.value.size.width,
          height: videoController.value.size.height,
          child: VideoPlayer(videoController),
        ),
      ),
    );
  }
}
