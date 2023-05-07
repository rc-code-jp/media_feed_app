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
            url: 'assets/videos/1.mp4',
            tags: ['ポップス', 'J-POP'],
          ),
          FeedItem(
            id: '2',
            title: 'オセロ',
            artistName: 'TOMOO',
            url: 'assets/videos/2.mp4',
            tags: ['ポップス', 'J-POP'],
          ),
          FeedItem(
            id: '3',
            title: 'ハニーボーイ',
            artistName: 'TOMOO',
            url: 'assets/videos/3.mp4',
            tags: ['ポップス', 'J-POP'],
          ),
        ]);

  @override
  void dispose() {
    // 全てのビデオを破棄する
    for (var feedItem in state) {
      if (!feedItem.hasVideoController()) break;
      feedItem.disposeVideo();
    }
    super.dispose();
  }

  // 次のアイテムを読み込む
  Future<void> fetchNextItems() async {
    if (state.length >= 5) {
      return;
    }
    final nextItems = [
      FeedItem(
        id: '4',
        title: 'ああああああ',
        artistName: 'TOMOO',
        url: 'assets/videos/4.mp4',
        tags: ['ポップス', 'J-POP'],
      ),
      FeedItem(
        id: '5',
        title: 'いいいいいい',
        artistName: 'TOMOO',
        url: 'assets/videos/5.mp4',
        tags: ['ポップス', 'J-POP'],
      ),
    ];
    state = [...state, ...nextItems];
  }

  // ビデオを読み込んで再生する
  Future<void> changeVideo(int feedIndex) async {
    // 前の動画を停止する
    if (feedIndex > 0) {
      final prevFeedItem = state[feedIndex - 1];
      prevFeedItem.pauseVideo();
    }

    // 後の動画を読み込んでから停止する
    // （スクロール時にポスターを出すため）
    if (feedIndex < state.length - 1) {
      final nextFeedItem = state[feedIndex + 1];
      if (!nextFeedItem.hasVideoController()) {
        await nextFeedItem.loadVideoController();
      }
      nextFeedItem.pauseVideo();
    }

    // 読み込んで再生する
    final feedItem = state[feedIndex];
    if (!feedItem.hasVideoController()) {
      await feedItem.loadVideoController();
    }
    feedItem.playFromStart();

    state = [...state];
  }

  // ビデオの再生を切り替える
  void toggleVideoById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    if (feedItem.isPlayingVideo()) {
      feedItem.pauseVideo();
    } else {
      feedItem.playVideo();
    }
    state = [...state];
  }

  // いいねを変更
  void toggleFavoriteById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isFavorite = !feedItem.isFavorite;
    state = [...state];
  }

  // 完了状態を変更
  void finishedItemById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isFinished = true;
    state = [...state];
  }

  // 完了状態を変更
  void acquisitionItemById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isAcquired = true;
    state = [...state];
  }
}
