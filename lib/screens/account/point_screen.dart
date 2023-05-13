import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/point/widgets/point_history_list.dart';
import 'package:media_feed_app/features/point/widgets/point_total.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class PointScreen extends ConsumerWidget {
  const PointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('ポイント'),
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: UtilStyles.decorationGradient,
        child: const SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: PointTotal(),
              ),
              SizedBox(height: 20),
              Text(
                '獲得・交換履歴（直近の6ヶ月分を表示しています）',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: PointHistoryList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
