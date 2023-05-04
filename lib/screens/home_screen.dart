import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/screens/home_children/dashboard_tab.dart';
import 'package:media_feed_app/screens/home_children/feed_tab.dart';
import 'package:media_feed_app/styles/colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.linearGradient1,
              AppColors.linearGradient2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: const [
            // タブの中身
            TabBarView(
              children: [
                DashboardTab(),
                FeedTab(),
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
