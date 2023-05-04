import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:media_feed_app/styles/colors.dart';

class Achievement extends ConsumerWidget {
  final int point;

  const Achievement({
    Key? key,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: point),
      duration: const Duration(milliseconds: 1000),
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
