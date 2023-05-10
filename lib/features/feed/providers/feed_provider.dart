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
            title: '普変 / THE FIRST TAKE',
            artistName: 'あの',
            url: 'assets/videos/1.mp4',
            tags: ['アイドル', 'J-POP', 'ボーカル'],
          ),
          FeedItem(
            id: '2',
            title: 'アイドル',
            artistName: 'yoasobi',
            url: 'assets/videos/2.mp4',
            tags: ['ポップス', 'J-POP'],
          ),
          FeedItem(
            id: '3',
            title: 'ひとりごつ',
            artistName: 'ちいかわ / ハチワレ',
            url: 'assets/videos/3.mp4',
            tags: ['ポップス', 'J-POP', 'アニメ'],
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
        title: '酔ひもせず ',
        artistName: 'TOMOO',
        url: 'assets/videos/4.mp4',
        tags: ['ポップス', 'J-POP'],
      ),
      FeedItem(
        id: '5',
        title: 'Musica',
        artistName: 'ブランデー戦記',
        url: 'assets/videos/5.mp4',
        tags: ['バンド', 'ロック', 'MV'],
      ),
      FeedItem(
        id: '6',
        title: '来たれ！ぱすはに道',
        artistName: 'ぱすはに',
        url: 'assets/videos/6.mp4',
        tags: ['アイドル', 'アニメ', 'インフルエンサー'],
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
