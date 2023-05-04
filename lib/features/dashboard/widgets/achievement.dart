import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';

class Achievement extends ConsumerWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (BuildContext context, snapshot) {
        return PieChart(
          swapAnimationDuration: const Duration(seconds: 1),
          swapAnimationCurve: Curves.easeOutExpo,
          PieChartData(
            startDegreeOffset: 270,
            sections: [
              PieChartSectionData(
                color: AppColors.success,
                value:
                    snapshot.connectionState == ConnectionState.done ? 60 : 0,
                title: "60pt",
                titleStyle:
                    const TextStyle(fontSize: 16, color: AppColors.white),
                radius: 100,
              ),
              PieChartSectionData(
                color: AppColors.lightGrey,
                value:
                    snapshot.connectionState == ConnectionState.done ? 40 : 100,
                showTitle: false,
                titleStyle:
                    const TextStyle(fontSize: 16, color: AppColors.grey),
                radius: 100,
              ),
            ],
            sectionsSpace: 0,
            centerSpaceRadius: 50,
          ),
        );
      },
    );
  }
}
