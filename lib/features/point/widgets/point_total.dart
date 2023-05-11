import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/point/widgets/achievement.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class PointTotal extends ConsumerWidget {
  const PointTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: 200,
      decoration: UtilStyles.decorationGlass,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Text(
            '今日の獲得ポイント',
            style: TextStyle(fontSize: 16, color: AppColors.white),
          ),
          Achievement(
            point: 1900,
            pointUnit: 'pt',
          ),
          Text(
            '（最も近い有効期限 2023.06.30）',
            style: TextStyle(fontSize: 12, color: AppColors.pink),
          ),
        ],
      ),
    );
  }
}
