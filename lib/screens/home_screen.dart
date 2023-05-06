import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/screens/dashboard_screen.dart';
import 'package:media_feed_app/screens/feed_screen.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: UtilStyles.boxGradient,
        child: Stack(
          children: const [
            // タブの中身
            TabBarView(
              children: [
                DashboardScreen(),
                FeedScreen(),
              ],
            ),
            // タブ
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: TabBar(
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.lightGrey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.white,
                  indicatorWeight: 2,
                  tabs: [
                    Tab(
                      text: 'ダッシュボード',
                    ),
                    Tab(
                      text: 'フィード',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
