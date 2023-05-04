import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/dashboard/widgets/achievement.dart';
import 'package:media_feed_app/styles/colors.dart';

class DashboardTab extends ConsumerWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.loose,
      children: const [
        // グラフ
        Achievement(),
        // タイトル
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(bottom: 350),
            child: Text(
              '今日の実績',
              style: TextStyle(color: AppColors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
