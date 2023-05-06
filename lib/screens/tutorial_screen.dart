import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TutorialScreen extends ConsumerWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            // チュートリアル完了後にログイン画面に遷移
            Navigator.pushReplacementNamed(context, '/sign-in');
          },
          child: const Text('ログインする'),
        ),
      ),
    );
  }
}
