import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/dialog/detail_modal.dart';
import 'package:media_feed_app/widgets/icon_text_button.dart';
import 'package:share_plus/share_plus.dart';

class FeedCardActions extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCardActions({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 36.0;

    return Positioned(
      bottom: 15,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 情報ボタン
          IconTextButton(
            icon: const Icon(
              Icons.info_outline,
              color: AppColors.white,
              size: iconSize,
            ),
            text: const Text(
              '情報',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.black.withOpacity(0.8),
                builder: (BuildContext context) {
                  return DetailModal(
                    artistName: feedItem.artistName,
                    title: feedItem.title,
                    subTitle: feedItem.hashtagNames(),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 5),

          // シェアボタン
          IconTextButton(
            icon: const Icon(
              Icons.share,
              color: AppColors.white,
              size: iconSize,
            ),
            text: const Text(
              'シェア',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
              ),
            ),
            onPressed: () {
              Share.share('${feedItem.title}を視聴中! https://example.com');
            },
          ),
        ],
      ),
    );
  }
}
