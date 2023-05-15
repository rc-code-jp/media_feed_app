import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/app_toast.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';
import 'package:media_feed_app/widgets/form/form_text_field.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends ConsumerState<SignUpForm> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    focusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit() async {
    focusNode.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      // ダミー
      await Future.delayed(
        const Duration(seconds: 2),
      );

      // コード認証画面へ
      if (!mounted) return;
      await Navigator.pushNamed(context, '/auth/sign-up/code');
    } catch (e) {
      AppToast.showError('認証に失敗しました');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormTextField(
            labelText: 'メールアドレス',
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          FormTextField(
            obscureText: true,
            labelText: 'パスワード',
            controller: passwordController,
          ),
          const SizedBox(
            height: 40,
          ),
          ActionButton(
            onPressed: submit,
            text: '認証する',
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
