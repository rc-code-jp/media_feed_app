import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.person,
                color: AppColors.white,
                size: 20,
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                feedItem.artistName,
                style: const TextStyle(fontSize: 16, color: AppColors.white),
              ),
            ],
          ),
          // 曲名
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.music_note,
                color: AppColors.white,
                size: 20,
              ),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                feedItem.title,
                style: const TextStyle(fontSize: 20, color: AppColors.white),
              ),
            ],
          ),
          // タグ
          const Text(
            '#ポップス #J-POP',
            style: TextStyle(fontSize: 16, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
