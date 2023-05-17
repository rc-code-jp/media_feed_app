import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/dummy_feed.dart';

final feedProvider =
    StateNotifierProvider.autoDispose<FeedStateNotifier, List<FeedItem>>((ref) {
  return FeedStateNotifier();
});

class FeedStateNotifier extends StateNotifier<List<FeedItem>> {
  FeedStateNotifier() : super([]);

  @override
  void dispose() {
    // 全てのビデオを破棄する
    for (var feedItem in state) {
      if (!feedItem.hasVideoController()) break;
      feedItem.disposeVideo();
    }
    super.dispose();
  }

  Future<void> fetchFirstItems() async {
    final items = getDummyFeed().sublist(0, 4);
    state = [...state, ...items];
  }

  // 次のアイテムを読み込む
  Future<void> fetchNextItems() async {
    if (state.length >= 6) {
      return;
    }
    final items = getDummyFeed().sublist(4);
    state = [...state, ...items];
  }

  // ビデオを読み込んで再生する
  Future<void> changeVideo(int feedIndex) async {
    // 前の動画を停止する
    if (feedIndex > 0) {
      final prevFeedItem = state[feedIndex - 1];
      prevFeedItem.pauseVideo();
    }

    // 後の動画を読み込んでから停止する
    if (feedIndex < state.length - 1) {
      final nextFeedItem = state[feedIndex + 1];
      if (!nextFeedItem.hasVideoController()) {
        // await nextFeedItem.loadVideoController();
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

  // 完了状態を変更
  void finishedItemById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isFinished = true;
    state = [...state];
  }

  // 完了状態を戻す
  void unFinishedItemById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isFinished = false;
    state = [...state];
  }

  // 獲得状態を変更
  void acquisitionItemById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isAcquired = true;
    state = [...state];
  }
}
