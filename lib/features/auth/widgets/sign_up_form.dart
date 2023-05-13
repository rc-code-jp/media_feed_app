import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends ConsumerState<SignUpForm> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
              // コード認証画面へ
              Navigator.pushNamed(context, '/auth/sign-up/code');
            },
            child: const Text('認証する'),
          ),
        ],
      ),
    );
  }
}
