import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/libraries/app_toast.dart';
import 'package:vuuum_app/libraries/auth_storage.dart';
import 'package:vuuum_app/widgets/form/action_button.dart';
import 'package:vuuum_app/widgets/form/form_text_field.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends ConsumerState<SignInForm> {
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
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

      // ログイン処理
      AuthStorage().write('dummy');

      // 画面をすべて除いてメイン画面に遷移
      if (!mounted) return;
      await Navigator.pushNamedAndRemoveUntil(
        context,
        '/main',
        (route) => false,
      );
    } catch (e) {
      AppToast.showError('ログインに失敗しました');
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
            text: 'ログイン',
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
