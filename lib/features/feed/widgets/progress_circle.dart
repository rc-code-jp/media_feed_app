import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';

class ProgressCircle extends ConsumerWidget {
  final double value;

  const ProgressCircle({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // サークル
        CircularProgressIndicator(
          strokeWidth: 2,
          value: value,
          color: AppColors.primary,
          backgroundColor: AppColors.white.withAlpha(50),
        ),
        // アイコン（完了時にフェードイン）
        Align(
          alignment: Alignment.center,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: value >= 1 ? 1 : 0,
            child: const Icon(
              Icons.check,
              size: 30,
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }
}
