import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:media_feed_app/styles/colors.dart';

class Achievement extends ConsumerWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: 620),
      duration: const Duration(milliseconds: 2000),
      builder: (BuildContext context, value, child) {
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: NumberFormat('#,##0').format(value),
                style: const TextStyle(
                  fontSize: 60,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' / ',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: '1,000pt',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
  }
}
