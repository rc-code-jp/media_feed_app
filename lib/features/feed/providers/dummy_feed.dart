import 'package:media_feed_app/features/feed/models/feed_item.dart';

String getDriveUrl(String videoId) {
  return 'https://drive.google.com/uc?id=$videoId&export=download';
}

// ダミー様なので本番では消す
List<FeedItem> getDummyFeed() {
  return [
    FeedItem(
      id: '1',
      title: 'Stellar Stellar / THE FIRST TAKE',
      artistName: '星街すいせい',
      url: getDriveUrl('1c0r6XcfXvriSeZossf1c-No-Bhq4QxX7'),
      tags: ['アイドル', 'J-POP', 'ボーカル'],
    ),
    FeedItem(
      id: '2',
      title: 'セブンティーン',
      artistName: 'YOASOBI',
      url: getDriveUrl('1HioT65OKDE2LjfklZ7mLicL50sMhLUu-'),
      tags: ['ポップス', 'J-POP'],
    ),
    FeedItem(
      id: '3',
      title: 'あの子コンプレックス',
      artistName: '=LOVE',
      url: getDriveUrl('1hgLqUyqC9Gec9zK8DVGk7rbuNdlOiTyt'),
      tags: ['ポップス', 'J-POP', 'アニメ'],
    ),
    FeedItem(
      id: '10',
      title: '青春グラフィティー',
      artistName: 'Peel the Apple',
      url: getDriveUrl('1ja9CKyNOHclkIzy3_-Y2frWbftIk3mBW'),
      tags: ['アイドル'],
      progressSeconds: 20,
    ),
    FeedItem(
      id: '9',
      title: 'Sugar Junky',
      artistName: '4s4ki',
      url: getDriveUrl('1rmmkc6ruQuyUcVgtpeobms-ukmJNQD6f'),
      tags: ['ラップ', 'ボーカル'],
      progressSeconds: 20,
    ),
    FeedItem(
      id: '4',
      title: 'Flutter♭',
      artistName: 'Flutter♭',
      url: getDriveUrl('1fZEwL6xMDt8DgNcm8PVuwAMxUxZXKuY2'),
      tags: ['アイドル', 'ボーカル'],
    ),
    FeedItem(
      id: '7',
      title: 'かくれんぼ',
      artistName: 'AliA',
      url: getDriveUrl('ccc'),
      tags: ['アイドル', 'MV'],
    ),
    FeedItem(
      id: '5',
      title: '来たれ！ぱすはに道',
      artistName: 'ぱすはに',
      url: getDriveUrl('1nlE_7UDR-8znay34VI_6_AyMBI7wWE54'),
      tags: ['アイドル', 'アニメ', 'インフルエンサー'],
    ),
  ];
}
