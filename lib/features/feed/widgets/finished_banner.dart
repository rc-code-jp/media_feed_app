import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';
import 'package:media_feed_app/styles/colors.dart';

class FinishedBanner extends ConsumerWidget {
  final FeedItem feedItem;

  const FinishedBanner({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!feedItem.isFinished || feedItem.isAcquired) {
      // 視聴済みの場合のみ表示する
      return Container();
    }

    return Positioned.fill(
      top: 300,
      child: Align(
        alignment: Alignment.topCenter,
        child: Opacity(
          opacity: 0.8,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.success,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            ),
            onPressed: () {
              ref.read(feedProvider.notifier).acquisitionItemById(feedItem.id);
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
        ),
      ),
    );
  }
}
