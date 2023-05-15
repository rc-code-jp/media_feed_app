import 'package:auto_route/auto_route.dart';
import 'package:media_feed_app/screens/account/news_screen.dart';
import 'package:media_feed_app/screens/account/play_history_screen.dart';
import 'package:media_feed_app/screens/account/point_screen.dart';
import 'package:media_feed_app/screens/account/setting_screen.dart';
import 'package:media_feed_app/screens/auth/sign_in_screen.dart';
import 'package:media_feed_app/screens/auth/sign_up_code_screen.dart';
import 'package:media_feed_app/screens/auth/sign_up_screen.dart';
import 'package:media_feed_app/screens/main/change_screen.dart';
import 'package:media_feed_app/screens/main/feed_screen.dart';
import 'package:media_feed_app/screens/main/main_screen.dart';
import 'package:media_feed_app/screens/main/my_page_screen.dart';
import 'package:media_feed_app/screens/start/start_screen.dart';
import 'package:media_feed_app/screens/start/tutorial_screen.dart';

// ジェネレートファイルを参照する
part 'app_router.gr.dart';

// ルート定義
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: MainRoute.page,
          children: [
            // 交換
            AutoRoute(
              path: 'change',
              page: ChangeRoute.page,
            ),
            // フィード
            AutoRoute(
              path: 'feed',
              page: FeedRoute.page,
            ),
            // マイページ
            AutoRoute(
              path: 'mypage',
              page: MyPageRoute.page,
            ),
            // 設定
            AutoRoute(
              path: 'setting',
              page: SettingRoute.page,
            ),
            // 再生履歴
            AutoRoute(
              path: 'play-history',
              page: PlayHistoryRoute.page,
            ),
            // ポイント詳細
            AutoRoute(
              path: 'point',
              page: PointRoute.page,
            ),
            // お知らせ
            AutoRoute(
              path: 'news',
              page: NewsRoute.page,
            ),
            // スタート
            AutoRoute(
              path: 'start',
              page: StartRoute.page,
            ),
            // チュートリアル
            AutoRoute(
              path: 'tutorial',
              page: StartRoute.page,
            ),
          ],
        ),
      ];
}
