import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';

final feedProvider = StateNotifierProvider<FeedProvider, List<FeedItem>>((ref) {
  return FeedProvider();
});

class FeedProvider extends StateNotifier<List<FeedItem>> {
  FeedProvider() : super([]);

  // アイテムを追加する
  void addItem(FeedItem item) {
    state.add(item);
  }
}
