import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';

final feedProvider = StateNotifierProvider<FeedProvider, List<FeedItem>>((ref) {
  return FeedProvider();
});

class FeedProvider extends StateNotifier<List<FeedItem>> {
  FeedProvider()
      : super([
          FeedItem(
              id: '1',
              title: 'title1',
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          FeedItem(
              id: '2',
              title: 'title2',
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
        ]);

  // アイテムを追加する
  void addItem() {
    final id = DateTime.now().toString();
    final newItem = FeedItem(
        id: id,
        title: id,
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    state = [...state, newItem];
  }
}
