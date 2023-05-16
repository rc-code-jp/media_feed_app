import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/app_toast.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';
import 'package:pinput/pinput.dart';

class SignUpCodeForm extends ConsumerStatefulWidget {
  const SignUpCodeForm({Key? key}) : super(key: key);

  @override
  SignUpCodeFormState createState() => SignUpCodeFormState();
}

class SignUpCodeFormState extends ConsumerState<SignUpCodeForm> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void submit() async {
    focusNode.unfocus();

    try {
      setState(() {
        isLoading = true;
      });

      // ダミー
      await Future.delayed(
        const Duration(seconds: 2),
      );

      // ログイン処理
      AuthStorage().write('dummy');

      // ユーザー登録画面へ
      if (!mounted) return;
      await Navigator.pushNamed(context, '/auth/sign-up/user');
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
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // コード入力
            Pinput(
              controller: pinController,
              focusNode: focusNode,
              autofocus: true,
              length: 6,
              defaultPinTheme: PinTheme(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.2),
                  border: Border.all(
                    color: AppColors.white.withOpacity(0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // 認証ボタン
            ActionButton(
              onPressed: submit,
              text: '認証する',
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
