import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/dashboard/widgets/achievement.dart';
import 'package:media_feed_app/styles/colors.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            '今日の実績',
            style: TextStyle(color: AppColors.white, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Achievement(point: 620),
        ],
      ),
    );
  }
}