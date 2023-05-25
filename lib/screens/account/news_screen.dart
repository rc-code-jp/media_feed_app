import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('お知らせ'),
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: UtilStyles.decorationGradient,
      child: const SafeArea(
        child: Column(
          children: [Text('お知らせ')],
        ),
      ),
    );
  }
}
