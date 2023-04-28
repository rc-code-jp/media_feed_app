import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';

final feedProvider =
    StateNotifierProvider.autoDispose<FeedProvider, List<FeedItem>>((ref) {
  return FeedProvider();
});

class FeedProvider extends StateNotifier<List<FeedItem>> {
  FeedProvider()
      : super([
          FeedItem(
              id: '1',
              title: 'Ginger',
              artistName: 'TOMOO',
              url: 'assets/videos/1.mp4'),
          FeedItem(
              id: '2',
              title: 'オセロ',
              artistName: 'TOMOO',
              url: 'assets/videos/2.mp4'),
          FeedItem(
              id: '3',
              title: 'ハニーボーイ',
              artistName: 'TOMOO',
              url: 'assets/videos/3.mp4'),
        ]);

  // ビデオを読み込む
  Future<void> playVideo(int feedIndex) async {
    final feedItem = state[feedIndex];
    await feedItem.loadVideoController();
    feedItem.videoController?.setVolume(1.0);
    feedItem.videoController?.play();
    state = [...state];
  }

  // ビデオを破棄
  void pauseVideo(int feedIndex) {
    final feedItem = state[feedIndex];
    feedItem.videoController?.pause();
    state = [...state];
  }
}
