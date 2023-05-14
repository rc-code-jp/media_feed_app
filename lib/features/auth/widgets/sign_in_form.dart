import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';
import 'package:media_feed_app/widgets/form/form_text_field.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends ConsumerState<SignInForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const FormTextField(
            labelText: 'メールアドレス',
          ),
          const SizedBox(
            height: 20,
          ),
          const FormTextField(
            obscureText: true,
            labelText: 'パスワード',
          ),
          const SizedBox(
            height: 20,
          ),
          ActionButton(
            onPressed: () {
              // ログイン処理
              AuthStorage().write('dummy');

              // 画面をすべて除いてメイン画面に遷移
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/main',
                (route) => false,
              );
            },
            text: 'ログイン',
          ),
        ],
      ),
    );
  }
}
