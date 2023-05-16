import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/app_toast.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';
import 'package:media_feed_app/widgets/form/form_date_field.dart';
import 'package:media_feed_app/widgets/form/form_text_field.dart';

class SignUpUserForm extends ConsumerStatefulWidget {
  const SignUpUserForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends ConsumerState<SignUpUserForm> {
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

      // 画面をすべて除いてメイン画面に遷移
      if (!mounted) return;
      await Navigator.pushNamedAndRemoveUntil(
        context,
        '/main',
        (route) => false,
      );
    } catch (e) {
      AppToast.showError('登録に失敗しました');
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
          FormDateField(
            labelText: '生年月日',
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          FormTextField(
            obscureText: true,
            labelText: '性別',
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
