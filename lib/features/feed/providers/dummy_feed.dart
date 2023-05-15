import 'package:media_feed_app/features/feed/models/feed_item.dart';

// ダミー様なので本番では消す
List<FeedItem> getDummyFeed() {
  return [
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
      id: '10',
      title: '青春グラフィティー',
      artistName: 'Peel the Apple',
      url: 'assets/videos/idol_aa.mp4',
      tags: ['アイドル'],
      progressSeconds: 20,
    ),
    FeedItem(
      id: '4',
      title: 'Flutter♭',
      artistName: 'Flutter♭',
      url: 'assets/videos/ff.mp4',
      tags: ['アイドル', 'ボーカル'],
    ),
    FeedItem(
      id: '9',
      title: 'Sugar Junky',
      artistName: '4s4ki',
      url: 'assets/videos/asaki_l.mp4',
      tags: ['ラップ', 'ボーカル'],
      progressSeconds: 20,
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
  ];
}
