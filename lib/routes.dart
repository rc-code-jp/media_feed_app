import 'package:flutter/material.dart';
import 'package:media_feed_app/screens/main_screen/main_screen.dart';
import 'package:media_feed_app/screens/my_page_screen/news_screen/news_screen.dart';
import 'package:media_feed_app/screens/my_page_screen/play_history_screen/play_history_screen.dart';
import 'package:media_feed_app/screens/my_page_screen/point_screen/point_screen.dart';
import 'package:media_feed_app/screens/my_page_screen/setting_screen/setting_screen.dart';
import 'package:media_feed_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:media_feed_app/screens/sign_up_screen/sign_up_code_screen/sign_up_code_screen.dart';
import 'package:media_feed_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:media_feed_app/screens/start_screen/start_screen.dart';
import 'package:media_feed_app/screens/tutorial_screen/tutorial_screen.dart';

final routes = <String, WidgetBuilder>{
  // ここに書くのはScaffoldを返すルートのみ
  '/main': (context) => const MainScreen(),
  '/start': (context) => const StartScreen(),
  '/tutorial': (context) => const TutorialScreen(),
  '/sign-in': (context) => const SignInScreen(),
  '/sign-up': (context) => const SignUpScreen(),
  '/sign-up/code': (context) => const SignUpCodeScreen(),
  '/my_page/play-history': (context) => const PlayHistoryScreen(),
  '/my_page/news': (context) => const NewsScreen(),
  '/my_page/point': (context) => const PointScreen(),
  '/my_page/setting': (context) => const SettingScreen(),
};
