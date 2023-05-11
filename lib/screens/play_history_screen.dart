import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/play_history/widget/play_history_list.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class PlayHistoryScreen extends ConsumerWidget {
  const PlayHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('再生履歴'),
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: UtilStyles.decorationGradient,
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: SafeArea(
            child: Column(
              children: const [
                // タブ
                TabBar(
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.lightGrey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.white,
                  indicatorWeight: 2,
                  tabs: [
                    Tab(
                      text: 'すべて',
                    ),
                    Tab(
                      text: '高評価',
                    ),
                  ],
                ),
                // タブの中身
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: PlayHistoryList(),
                      ),
                      SingleChildScrollView(
                        child: PlayHistoryList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
