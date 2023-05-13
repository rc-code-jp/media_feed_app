import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/styles/colors.dart';

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
    final items = [
      FeedItem(
        id: '1',
        title: '普変 / THE FIRST TAKE',
        artistName: 'あの',
        url: 'assets/videos/ano.mp4',
        tags: ['アイドル', 'J-POP', 'ボーカル'],
      ),
      FeedItem(
        id: '2',
        title: 'セブンティーン',
        artistName: 'YOASOBI',
        url: 'assets/videos/yoasobi_17.mp4',
        tags: ['ポップス', 'J-POP'],
      ),
      FeedItem(
        id: '3',
        title: 'ひとりごつ',
        artistName: 'ちいかわ / ハチワレ',
        url: 'assets/videos/chi.mp4',
        tags: ['ポップス', 'J-POP', 'アニメ'],
      ),
      FeedItem(
        id: '4',
        title: '超破滅的思考',
        artistName: '4s4ki',
        url: 'assets/videos/asaki.mp4',
        tags: ['ラップ', 'ボーカル'],
      ),
      FeedItem(
        id: '9',
        title: 'Sugar Junky',
        artistName: '4s4ki',
        url: 'assets/videos/asaki_l.mp4',
        tags: ['ラップ', 'ボーカル'],
      ),
    ];
    state = [...state, ...items];
  }

  // 次のアイテムを読み込む
  Future<void> fetchNextItems() async {
    if (state.length >= 6) {
      return;
    }
    final items = [
      FeedItem(
        id: '10',
        title: '青春グラフィティー',
        artistName: 'Peel the Apple',
        url: 'assets/videos/idol_aa.mp4',
        tags: ['アイドル'],
      ),
      FeedItem(
        id: '5',
        title: '来たれ！ぱすはに道',
        artistName: 'ぱすはに',
        url: 'assets/videos/zepa.mp4',
        tags: ['アイドル', 'アニメ', 'インフルエンサー'],
      ),
      FeedItem(
        id: '7',
        title: 'かくれんぼ',
        artistName: 'AliA',
        url: 'assets/videos/alia.mp4',
        tags: ['アイドル', 'MV'],
      ),
      FeedItem(
        id: '8',
        title: 'Musica',
        artistName: 'ブランデー戦記',
        url: 'assets/videos/burande.mp4',
        tags: ['バンド', 'ロック', 'MV'],
      ),
      FeedItem(
        id: '6',
        title: '酔ひもせず ',
        artistName: 'TOMOO',
        url: 'assets/videos/tomo.mp4',
        tags: ['ポップス', 'J-POP'],
      ),
    ];
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

  // 完了状態を変更
  void finishedItemById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isFinished = true;
    state = [...state];
  }

  // 獲得状態を変更
  void acquisitionItemById(String id) {
    final feedItem = state.firstWhere((feedItem) => feedItem.id == id);
    feedItem.isAcquired = true;
    state = [...state];

    // エラーを発生させる（仮）
    if (id == '3') {
      Fluttertoast.showToast(
        msg: "エラーが発生しました、何も起きていません。",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.black,
        textColor: AppColors.white,
        fontSize: 16.0,
      );
    }
  }
}
