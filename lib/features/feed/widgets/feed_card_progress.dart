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
  late Timer timer;
  late double progressValue = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (progressValue >= 3) {
        timer.cancel();
        ref.read(feedProvider.notifier).doneItemById(widget.feedItem.id);
      }
      setState(() {
        progressValue += 0.02; // 5秒で1.0になる
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProgressCircle(
            value: progressValue - 2,
          ),
          const Padding(padding: EdgeInsets.only(right: 15)),
          ProgressCircle(
            value: progressValue - 1,
          ),
          const Padding(padding: EdgeInsets.only(right: 15)),
          ProgressCircle(
            value: progressValue,
          )
        ],
      ),
    );
  }
}
