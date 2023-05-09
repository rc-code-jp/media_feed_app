import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/sizes.dart';
import 'package:media_feed_app/widgets/icon_text_row.dart';

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

    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + Sizes.topTabHeight),
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 0.7),
          duration: const Duration(milliseconds: 300),
          child: const IconTextRow(
            icon: Icon(
              Icons.verified,
              color: AppColors.white,
              size: 20,
            ),
            text: Text(
              'ポイント獲得済み',
              style: TextStyle(fontSize: 16, color: AppColors.white),
            ),
          ),
          builder: (BuildContext context, double value, Widget? child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
