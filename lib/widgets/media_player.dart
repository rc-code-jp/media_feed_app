import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class MediaPlayer extends ConsumerStatefulWidget {
  // 動画URL
  final String mediaUrl;
  // 初期化完了時のコールバック
  final Function? initializedCallbackHandler;

  const MediaPlayer(
      {Key? key, required this.mediaUrl, this.initializedCallbackHandler})
      : super(key: key);

  @override
  MediaPlayerState createState() => MediaPlayerState();
}

class MediaPlayerState extends ConsumerState<MediaPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.mediaUrl);
    _controller.setLooping(true);
    _controller.setVolume(1);
    _controller.initialize().then((_) {
      setState(() {
        _controller.play();
        widget.initializedCallbackHandler?.call();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: GestureDetector(
            onTap: () {
              // タップで再生・一時停止
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // 動画を表示
                  child: VideoPlayer(_controller),
                ),
              ],
            )));
  }
}
