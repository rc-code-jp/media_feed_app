import 'package:flutter/material.dart';
import 'package:media_feed_app/screens/account/news_screen.dart';
import 'package:media_feed_app/screens/account/play_history_screen.dart';
import 'package:media_feed_app/screens/account/point_screen.dart';
import 'package:media_feed_app/screens/account/setting_screen.dart';
import 'package:media_feed_app/screens/auth/sign_in_screen.dart';
import 'package:media_feed_app/screens/auth/sign_up_code_screen.dart';
import 'package:media_feed_app/screens/auth/sign_up_screen.dart';
import 'package:media_feed_app/screens/main/main_screen.dart';
import 'package:media_feed_app/screens/start/start_screen.dart';
import 'package:media_feed_app/screens/start/tutorial_screen.dart';

final routes = <String, WidgetBuilder>{
  // ここに書くのはScaffoldを返すルートのみ
  '/main': (context) => const MainScreen(),
  '/start': (context) => const StartScreen(),
  '/tutorial': (context) => const TutorialScreen(),
  '/auth/sign-in': (context) => const SignInScreen(),
  '/auth/sign-up': (context) => const SignUpScreen(),
  '/auth/sign-up/code': (context) => const SignUpCodeScreen(),
  '/account/play-history': (context) => const PlayHistoryScreen(),
  '/account/news': (context) => const NewsScreen(),
  '/account/point': (context) => const PointScreen(),
  '/account/setting': (context) => const SettingScreen(),
};
