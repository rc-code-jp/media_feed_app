import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';

class FeedCardDetail extends ConsumerWidget {
  final FeedItem feedItem;

  const FeedCardDetail({Key? key, required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // 歌手名
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.person,
            color: Colors.white,
            size: 16,
          ),
          Padding(padding: EdgeInsets.only(left: 14)),
          Text('夜光性アミューズ', style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
      // 曲名
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.music_note,
            color: Colors.white,
            size: 20,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text('夜光性イントロデュース',
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
      // タグ
      const Text('#アイドル #J-POP',
          style: TextStyle(fontSize: 16, color: Colors.white)),
    ]));
  }
}
