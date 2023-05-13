import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/icon_text_row.dart';

class DetailModal extends ConsumerWidget {
  final String artistName;
  final String title;
  final String subTitle;

  const DetailModal({
    Key? key,
    required this.artistName,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 歌手名
          IconTextRow(
            icon: const Icon(
              Icons.person,
              color: AppColors.white,
              size: 20,
            ),
            text: Text(
              artistName,
              style: const TextStyle(
                fontSize: 20,
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
            width: 180,
            height: 180,
          ),

          const SizedBox(
            height: 10,
          ),

          // 曲名
          IconTextRow(
            icon: const Icon(
              Icons.music_note,
              color: AppColors.white,
              size: 20,
            ),
            text: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          // タグ
          Text(
            subTitle,
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
