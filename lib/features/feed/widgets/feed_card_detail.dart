import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/icon_text_row.dart';

class FeedCardDetail extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCardDetail({Key? key, required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 歌手名
          IconTextRow(
            icon: const Icon(
              Icons.person,
              color: AppColors.white,
              size: 20,
            ),
            text: Text(
              feedItem.artistName,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ),

          // 曲名
          IconTextRow(
            icon: const Icon(
              Icons.music_note,
              color: AppColors.white,
              size: 20,
            ),
            text: Text(
              feedItem.title,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
          ),

          // タグ
          Text(
            feedItem.hashtagNames(),
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
