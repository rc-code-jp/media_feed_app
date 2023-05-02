import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';

class FinishedBanner extends ConsumerStatefulWidget {
  final FeedItem feedItem;

  const FinishedBanner({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  FinishedBannerState createState() => FinishedBannerState();
}

class FinishedBannerState extends ConsumerState<FinishedBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      top: 200,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'GET !!!',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
