import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:media_feed_app/styles/colors.dart';

class Achievement extends ConsumerWidget {
  final int point;
  final String? pointUnit;
  final int? maxPoint;

  const Achievement({
    Key? key,
    required this.point,
    this.pointUnit,
    this.maxPoint,
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
                  fontSize: 50,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: pointUnit ?? '',
                style: const TextStyle(color: AppColors.white, fontSize: 20),
              ),
              maxPoint != null
                  ? TextSpan(
                      text: '/ ${NumberFormat('#,##0').format(maxPoint)}pt',
                      style:
                          const TextStyle(color: AppColors.white, fontSize: 20),
                    )
                  : const TextSpan(),
            ],
          ),
        );
      },
    );
  }
}
