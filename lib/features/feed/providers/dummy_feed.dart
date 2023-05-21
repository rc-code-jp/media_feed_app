import 'package:vuuum_app/features/feed/models/feed_item.dart';

// ダミー様なので本番では消す
List<FeedItem> getDummyFeed() {
  return [
    FeedItem(
      id: '1',
      title: 'Stellar Stellar / THE FIRST TAKE',
      artistName: '星街すいせい',
      url: 'assets/videos/hoshimati.mp4',
      tags: ['J-POP', 'バーチャル'],
    ),
    FeedItem(
      id: '5',
      title: '白昼夢',
      artistName: 'Islet',
      url: 'assets/videos/hakuchumu.mp4',
      tags: ['ポップス', 'J-POP', 'アニメ'],
    ),
    FeedItem(
      id: '99',
      title: 'Musica',
      artistName: 'ブランデー戦記',
      url: 'assets/videos/burande.mp4',
      tags: ['J-POP', 'ボーカル'],
    ),
    FeedItem(
      id: '2',
      title: 'かくれんぼ',
      artistName: 'Alia',
      url: 'assets/videos/alia.mp4',
      tags: ['ポップス', 'J-POP'],
    ),
    FeedItem(
      id: '4',
      title: 'Flutter♭',
      artistName: 'Flutter♭',
      url: 'assets/videos/ff.mp4',
      tags: ['アイドル', 'ボーカル'],
    ),
    FeedItem(
      id: '7',
      title: '夜行性',
      artistName: 'Anonymouz アノニムーズ',
      url: 'assets/videos/nemurenai.mp4',
      tags: ['ポップス', 'J-POP'],
    ),
  ];
}
