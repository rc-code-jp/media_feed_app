import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/features/point/widgets/achievement.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';

class PointToday extends ConsumerWidget {
  const PointToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: UtilStyles.decorationGlass,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '今日の獲得ポイント',
            style: TextStyle(fontSize: 16, color: AppColors.white),
          ),
          Achievement(
            point: 80,
            maxPoint: 100,
          ),
          Text(
            '累計所持ポイント: 867pt',
            style: TextStyle(fontSize: 12, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
