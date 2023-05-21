import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/styles/colors.dart';

class ChangeScreen extends ConsumerWidget {
  const ChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AppBar(
          title: const Text('ポイント交換'),
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.white,
          elevation: 0,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
