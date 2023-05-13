import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';

class PointModal extends ConsumerWidget {
  final int point;

  const PointModal({
    Key? key,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 300),
        child: Text(
          '+ ${point}pt',
          style: const TextStyle(
            fontSize: 50,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(
            opacity: value,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30 * value),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
