import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('アカウント'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: ログアウト処理
                AuthStorage().delete();
                // ログアウト後にスタート画面に遷移
                Navigator.popAndPushNamed(context, '/start');
              },
              child: const Text('ログアウト'),
            )
          ],
        ),
      ),
    );
  }
}
