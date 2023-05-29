import 'package:vuuum_app/features/feed/models/feed_item.dart';

// ダミー様なので本番では消す
List<FeedItem> getDummyFeed() {
  return [
    FeedItem(
      id: '1',
      title: 'ミュージックA',
      artistName: 'アーティスト1',
      url: 'assets/videos/fuzzy_Conton_Candy.mp4',
      tags: ['ジャンルA', 'ジャンルB'],
    ),
    FeedItem(
      id: '5',
      title: 'ミュージックB',
      artistName: 'アーティスト2',
      url: 'assets/videos/yosugala-yoakenouta.me.mp4',
      tags: ['ジャンルA', 'ジャンルB', 'ジャンルC'],
    ),
    FeedItem(
      id: '99',
      title: 'ミュージックC',
      artistName: 'アーティスト3',
      url: 'assets/videos/hakuchumu.mp4',
      tags: ['ジャンルA', 'ジャンルC'],
    ),
    FeedItem(
      id: '2',
      title: 'ミュージックD',
      artistName: 'アーティスト4',
      url: 'assets/videos/hoshimati.mp4',
      tags: ['ジャンルB', 'ジャンルC'],
    ),
    FeedItem(
      id: '4',
      title: 'ミュージックE',
      artistName: 'アーティスト5',
      url: 'assets/videos/nemurenai.mp4',
      tags: ['ジャンルA', 'ジャンルB', 'ジャンルC'],
    ),
    FeedItem(
      id: '7',
      title: 'ミュージックF',
      artistName: 'アーティスト6',
      url: 'assets/videos/asaki_sugar.mp4',
      tags: ['ジャンルA', 'ジャンルB', 'ジャンルC'],
    ),
  ];
}
