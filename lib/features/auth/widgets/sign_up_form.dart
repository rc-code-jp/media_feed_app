import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';
import 'package:media_feed_app/widgets/form/form_text_field.dart';

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
              // コード認証画面へ
              Navigator.pushNamed(context, '/auth/sign-up/code');
            },
            text: '認証する',
          ),
        ],
      ),
    );
  }
}
