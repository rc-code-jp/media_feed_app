import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/account/widget/account_link_list.dart';
import 'package:media_feed_app/features/point/widgets/point_today.dart';
import 'package:media_feed_app/styles/colors.dart';

@RoutePage()
class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AppBar(
          title: const Text('マイページ'),
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.white,
          elevation: 0,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: PointToday(),
        ),
        const SizedBox(height: 10),
        const Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: AccountLinkList(),
            ),
          ),
        ),
      ],
    );
  }
}