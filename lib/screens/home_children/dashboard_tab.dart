import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';

class DashboardTab extends ConsumerWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.black,
      ),
      child: const Center(
        child: Text(
          'ダッシュボード',
          style: TextStyle(fontSize: 20, color: AppColors.white),
        ),
      ),
    );
  }
}
