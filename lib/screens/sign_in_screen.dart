import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Center(
        child: Column(
          children: [
            // TODO: flutter_form_builderとか良さそう
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'メールアドレス',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: 'パスワード',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // ログイン処理
                AuthStorage().write('dummy');
                // ログイン後にホーム画面に遷移
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: const Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
