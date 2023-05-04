import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/icon_text_row.dart';

class DetailModal extends ConsumerWidget {
  final FeedItem feedItem;

  const DetailModal({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 歌手名
        IconTextRow(
          icon: const Icon(
            Icons.person,
            color: AppColors.white,
            size: 24,
          ),
          text: Text(
            feedItem.artistName,
            style: const TextStyle(
              fontSize: 24,
              color: AppColors.white,
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        // 画像
        Image.asset(
          'assets/images/artist.png',
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),

        const SizedBox(
          height: 10,
        ),

        // 曲名
        IconTextRow(
          icon: const Icon(
            Icons.music_note,
            color: AppColors.white,
            size: 30,
          ),
          text: Text(
            feedItem.title,
            style: const TextStyle(
              fontSize: 30,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
