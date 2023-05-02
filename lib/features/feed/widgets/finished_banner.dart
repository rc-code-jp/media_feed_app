import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/feed/models/feed_item.dart';
import 'package:media_feed_app/features/feed/providers/feed_provider.dart';

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
    return widget.feedItem.isDone
        ? Positioned.fill(
            top: 150,
            child: Align(
              alignment: Alignment.topCenter,
              child: _buildContent(),
            ),
          )
        : Container();
  }

  Widget _buildContent() {
    if (widget.feedItem.isCompleted) {
      return TextButton.icon(
        onPressed: null,
        icon: const Icon(
          Icons.check,
          color: Colors.greenAccent,
          size: 30,
        ),
        label: const Text(
          'Completed !',
          style: TextStyle(color: Colors.greenAccent, fontSize: 30),
        ),
      );
    } else if (widget.feedItem.isDone) {
      return TextButton.icon(
        onPressed: () {
          ref.read(feedProvider.notifier).completeItemById(widget.feedItem.id);
        },
        icon: const Icon(
          Icons.check_circle_outline,
          color: Colors.greenAccent,
          size: 30,
        ),
        label: const Text(
          'Click here !',
          style: TextStyle(color: Colors.greenAccent, fontSize: 30),
        ),
      );
    } else {
      return Container();
    }
  }
}
