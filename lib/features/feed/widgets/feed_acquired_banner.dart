import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';

class FeedAcquiredBanner extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedAcquiredBanner({Key? key, required this.feedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!feedItem.isAcquired) {
      // 獲得済みではない場合は表示しない
      return Container();
    }

    return Positioned(
      top: MediaQuery.of(context).padding.top + 60, // SafeAreaとTabBarの高さを考慮
      width: MediaQuery.of(context).size.width,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 0.9),
        duration: const Duration(milliseconds: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.verified,
              color: AppColors.white,
              size: 20,
            ),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(
              'ポイント獲得済み',
              style: TextStyle(fontSize: 16, color: AppColors.white),
            ),
          ],
        ),
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
      ),
    );
  }
}
