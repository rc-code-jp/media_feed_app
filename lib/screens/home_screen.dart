import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/screens/home_tab_children/feed_tab.dart';
import 'package:media_feed_app/screens/home_tab_children/home_tab.dart';
import 'package:media_feed_app/styles/colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 100,
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: AppColors.transparent,
          bottom: const TabBar(
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColors.white,
            indicatorWeight: 2,
            tabs: [
              Tab(
                text: 'ホーム',
              ),
              Tab(
                text: 'フィード',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeTab(),
            FeedTab(),
          ],
        ),
      ),
    );
  }
}
