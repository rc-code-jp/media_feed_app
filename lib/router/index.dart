import 'package:go_router/go_router.dart';
import 'package:media_feed_app/screens/feed.dart';
import 'package:media_feed_app/screens/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/feed',
      builder: (context, state) => const FeedScreen(),
    ),
  ],
);
