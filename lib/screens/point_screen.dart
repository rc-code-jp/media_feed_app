import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: UtilStyles.decorationGradient,
        child: SafeArea(
          child: Column(
            children: const [PointTotal()],
          ),
        ),
      ),
    );
  }
}
