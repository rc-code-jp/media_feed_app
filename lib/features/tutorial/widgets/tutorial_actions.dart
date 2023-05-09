import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              child: ElevatedButton(
                onPressed: onBack,
                child: const Text('戻る'),
              ),
            ),
            // スキップボタン
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: onForward,
                child: const Text('次へ'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
