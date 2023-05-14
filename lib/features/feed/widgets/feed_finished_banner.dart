import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/features/feed/widgets/star_button_list.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/dialog/point_dialog.dart';

class FeedFinishedBanner extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedFinishedBanner({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  // 獲得する
  void acquisition(BuildContext context, WidgetRef ref, int pressedNumber) {
    // ダイアログを表示・自動で閉じる
    _showPointDialog(context, point: 3);
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      Navigator.of(context).pop();
      timer.cancel();

      // 獲得済みにする
      ref.read(feedProvider.notifier).acquisitionItemById(feedItem.id);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!feedItem.isFinished || feedItem.isAcquired) {
      // 視聴済みの場合のみ表示する
      return Container();
    }

    return Align(
      alignment: Alignment.center,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '評価してポイントを獲得',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StarButtonList(
                onPressedCallback: (pressedNumber) async {
                  acquisition(context, ref, pressedNumber);
                },
              ),
            ],
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
  void _showPointDialog(BuildContext context, {int point = 0}) {
    showDialog(
      context: context,
      barrierDismissible: false, // ダイアログ外をタップしても閉じない
      builder: (BuildContext context) {
        return PointModal(
          point: point,
        );
      },
    );
  }
}
