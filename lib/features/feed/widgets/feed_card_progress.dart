import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/progress_circle.dart';
import 'package:media_feed_app/styles/sizes.dart';

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
  final double _progressValueMax = 3.0;
  late Timer _timer;
  late double _progressValue = 0;

  @override
  void initState() {
    super.initState();

    // すでに視聴済みの場合は最大値にする
    if (widget.feedItem.isFinished) {
      _progressValue = _progressValueMax;
    }

    // タイマー
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!widget.feedItem.isPlayingVideo()) {
        return;
      }
      if (_progressValue >= _progressValueMax) {
        _timer.cancel();
        ref.read(feedProvider.notifier).finishedItemById(widget.feedItem.id);
      }
      setState(() {
        _progressValue += 0.02; // 5秒で1.0になる
      });
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
      top: MediaQuery.of(context).padding.top +
          Sizes.topTabHeight, // SafeAreaとTabBarの高さを考慮
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProgressCircle(
            value: _progressValue - 2, // 3周目から始める
          ),
          const SizedBox(
            width: 15,
          ),
          ProgressCircle(
            value: _progressValue - 1, // 2周目から始める
          ),
          const SizedBox(
            width: 15,
          ),
          ProgressCircle(
            value: _progressValue,
          )
        ],
      ),
    );
  }
}
