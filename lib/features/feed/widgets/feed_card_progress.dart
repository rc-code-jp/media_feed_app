import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/progress_circle.dart';

class FeedCardProgress extends ConsumerStatefulWidget {
  final FeedItem feedItem;

  const FeedCardProgress({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  FeedCardProgressState createState() => FeedCardProgressState();
}

class FeedCardProgressState extends ConsumerState<FeedCardProgress> {
  late double _progressValueMax;
  late Timer _timer;
  late double _progressValue = 0;

  @override
  void initState() {
    super.initState();

    // 5秒ごと
    _progressValueMax = widget.feedItem.progressSeconds / 5;

    // すでに視聴済みの場合は最大値にする
    if (widget.feedItem.isFinished) {
      _progressValue = _progressValueMax;
    }

    final unFinishedValue = _progressValueMax + 1;

    // タイマー
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!widget.feedItem.isPlayingVideo()) {
        return;
      }

      // 完了にする
      if (!widget.feedItem.isFinished && _progressValue >= _progressValueMax) {
        ref.read(feedProvider.notifier).finishedItemById(widget.feedItem.id);
      }

      // 獲得せずに一定時間で完了をもどす
      if (!widget.feedItem.isAcquired && _progressValue >= unFinishedValue) {
        setState(() {
          _progressValue = 0;
          ref
              .read(feedProvider.notifier)
              .unFinishedItemById(widget.feedItem.id);
        });
      } else {
        // 5秒で1.0になるように加算
        setState(() {
          _progressValue += 0.02;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.feedItem.isAcquired) {
      // 獲得済みの場合は完了テキストを表示
      return Container();
    }

    return Positioned(
      top: MediaQuery.of(context).padding.top, // SafeArea
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 50,
          ),
          for (var i = 0; i < _progressValueMax; i++)
            ProgressCircle(
              value: _progressValue - i,
            ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
