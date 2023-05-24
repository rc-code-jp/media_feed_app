import 'package:vuuum_app/features/feed/models/feed_item.dart';

String getUrl(int value) {
  switch (value) {
    case 1:
      return 'https://s3.ap-northeast-1.amazonaws.com/devs.butterfly.fan/bf_newproduct_test/output/v2/fuzzy_Conton_Candy.m3u8';
    case 2:
      return 'https://s3.ap-northeast-1.amazonaws.com/devs.butterfly.fan/bf_newproduct_test/output/v2/hoshimati.m3u8';
    case 3:
      return 'https://s3.ap-northeast-1.amazonaws.com/devs.butterfly.fan/bf_newproduct_test/output/v2/asaki_sugar.m3u8';
    default:
      return 'https://s3.ap-northeast-1.amazonaws.com/devs.butterfly.fan/bf_newproduct_test/output/v2/ano.m3u8';
  }
}

// ダミー様なので本番では消す
List<FeedItem> getDummyFeed() {
  return [
    FeedItem(
      id: '1',
      title: 'Stellar Stellar / THE FIRST TAKE',
      artistName: '星街すいせい',
      url: getUrl(1),
      tags: ['J-POP', 'バーチャル'],
    ),
    FeedItem(
      id: '5',
      title: '白昼夢',
      artistName: 'Islet',
      url: getUrl(2),
      tags: ['ポップス', 'J-POP', 'アニメ'],
    ),
    FeedItem(
      id: '99',
      title: 'Musica',
      artistName: 'ブランデー戦記',
      url: getUrl(3),
      tags: ['J-POP', 'ボーカル'],
    ),
    FeedItem(
      id: '2',
      title: 'かくれんぼ',
      artistName: 'Alia',
      url: getUrl(4),
      tags: ['ポップス', 'J-POP'],
    ),
    FeedItem(
      id: '4',
      title: 'Flutter♭',
      artistName: 'Flutter♭',
      url: getUrl(1),
      tags: ['アイドル', 'ボーカル'],
    ),
    FeedItem(
      id: '7',
      title: '夜行性',
      artistName: 'Anonymouz アノニムーズ',
      url: getUrl(2),
      tags: ['ポップス', 'J-POP'],
    ),
    FeedItem(
      id: '999',
      title: '未来1',
      artistName: 'Future Artist',
      url: getUrl(3),
      tags: ['ポップス', 'J-POP'],
    ),
    FeedItem(
      id: '333',
      title: '未来2',
      artistName: 'Future Artist X',
      url: getUrl(4),
      tags: ['ポップス', 'J-POP'],
    ),
  ];
}
