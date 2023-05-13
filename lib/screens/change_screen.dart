import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';

class ChangeScreen extends ConsumerWidget {
  const ChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('交換', style: TextStyle(color: AppColors.primary)),
    );
  }
}
