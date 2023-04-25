import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';

final feedProvider = StateNotifierProvider<FeedProvider, List<FeedItem>>((ref) {
  return FeedProvider();
});

class FeedProvider extends StateNotifier<List<FeedItem>> {
  FeedProvider()
      : super([
          FeedItem(id: '1', title: 'title1', url: ''),
          FeedItem(id: '2', title: 'title2', url: ''),
        ]);

  // アイテムを追加する
  void addItem(FeedItem item) {
    state = [...state, item];
  }
}
