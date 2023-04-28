import 'package:go_router/go_router.dart';
import 'package:media_feed_app/screens/feed_screen.dart';
import 'package:media_feed_app/screens/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'feed',
            builder: (context, state) => FeedScreen(),
          ),
        ]),
  ],
);
