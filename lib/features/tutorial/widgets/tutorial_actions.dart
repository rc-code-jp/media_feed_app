import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';

class TutorialActions extends ConsumerWidget {
  final VoidCallback? onBack;
  final VoidCallback? onForward;

  const TutorialActions({
    super.key,
    this.onBack,
    this.onForward,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 戻るボタン
            SizedBox(
              width: 100,
              child: ActionButton(
                onPressed: onBack,
                text: '戻る',
              ),
            ),
            // スキップボタン
            SizedBox(
              width: 100,
              child: ActionButton(
                onPressed: onForward,
                text: '次へ',
              ),
            )
          ],
        ),
      ),
    );
  }
}
