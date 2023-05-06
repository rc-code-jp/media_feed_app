import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends ConsumerState<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
    );
  }
}
