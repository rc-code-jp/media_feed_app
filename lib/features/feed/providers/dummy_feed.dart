import 'package:media_feed_app/features/feed/models/feed_item.dart';

// ダミー様なので本番では消す
List<FeedItem> getDummyFeed() {
  return [
    FeedItem(
      id: '1',
      title: 'Stellar Stellar / THE FIRST TAKE',
      artistName: '星街すいせい',
      url: 'assets/videos/hoshimati.mp4',
      tags: ['アイドル', 'J-POP', 'ボーカル'],
    ),
    FeedItem(
      id: '7',
      title: 'かくれんぼ',
      artistName: 'AliA',
      url: 'assets/videos/alia.mp4',
      tags: ['アイドル', 'MV'],
    ),
    FeedItem(
      id: '2',
      title: 'セブンティーン',
      artistName: 'YOASOBI',
      url: 'assets/videos/yoasobi_17.mp4',
      tags: ['ポップス', 'J-POP'],
    ),
    FeedItem(
      id: '5',
      title: '小喋日和',
      artistName: 'FantasticYouth',
      url: 'assets/videos/hiyori.mp4',
      tags: ['アニメ'],
    ),
    FeedItem(
      id: '4',
      title: 'Flutter♭',
      artistName: 'Flutter♭',
      url: 'assets/videos/ff.mp4',
      tags: ['アイドル', 'ボーカル'],
      progressSeconds: 20,
    ),
    FeedItem(
      id: '3',
      title: 'すずめ feat.十明',
      artistName: 'RADWIMPS',
      url: 'assets/videos/suzume.mp4',
      tags: ['ポップス', 'J-POP', 'アニメ'],
      progressSeconds: 20,
    ),
  ];
}
