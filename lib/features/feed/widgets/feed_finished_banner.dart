import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/point_get_dialog.dart';
import 'package:media_feed_app/styles/colors.dart';

class FeedFinishedBanner extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedFinishedBanner({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!feedItem.isFinished || feedItem.isAcquired) {
      // 視聴済みの場合のみ表示する
      return Container();
    }

    return Align(
      alignment: Alignment.center,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 0.9),
        duration: const Duration(milliseconds: 300),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.white,
            backgroundColor: AppColors.success,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          ),
          onPressed: () async {
            ref.read(feedProvider.notifier).acquisitionItemById(feedItem.id);

            // ダイアログを表示・自動で閉じる
            _showPointDialog(context);
            Timer.periodic(const Duration(milliseconds: 1000), (timer) {
              Navigator.of(context).pop();
              timer.cancel();
            });
          },
          icon: const Icon(
            Icons.touch_app,
            size: 30,
          ),
          label: const Text(
            'ポイントをGETする',
            style: TextStyle(fontSize: 24),
          ),
        ),
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(
            opacity: value,
            child: Padding(
              padding: EdgeInsets.only(top: 30 * value),
              child: child,
            ),
          );
        },
      ),
    );
  }

  // ポイント表示ダイアログを表示
  void _showPointDialog(BuildContext context, {int point = 10}) {
    showDialog(
      context: context,
      barrierDismissible: false, // ダイアログ外をタップしても閉じない
      builder: (BuildContext context) {
        return PointGetModal(
          point: point,
        );
      },
    );
  }
}
