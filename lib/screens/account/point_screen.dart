import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/point/widgets/point_history_list.dart';
import 'package:media_feed_app/features/point/widgets/point_total.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

@RoutePage()
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
                'ポイントは獲得から180日間有効です',
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
