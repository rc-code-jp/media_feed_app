import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('ニュース'),
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: UtilStyles.decorationGradient,
        child: SafeArea(
          child: Column(
            children: const [Text('ニュース')],
          ),
        ),
      ),
    );
  }
}
