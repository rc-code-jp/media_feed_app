import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/home/widget/home_link_list.dart';
import 'package:media_feed_app/features/point/widgets/point_today.dart';
import 'package:media_feed_app/styles/colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppBar(
            title: const Text('マイページ'),
            backgroundColor: AppColors.transparent,
            elevation: 0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: PointToday(),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: HomeLinkList(),
          ),
        ],
      ),
    );
  }
}
