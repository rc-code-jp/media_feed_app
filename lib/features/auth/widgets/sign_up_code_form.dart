import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
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
            const Text(
              '認証コードを入力してください',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
              height: 20,
            ),
            // 認証ボタン
            ActionButton(
              onPressed: () {
                focusNode.unfocus();
                // ログイン処理
                AuthStorage().write('dummy');

                // 画面をすべて除いてメイン画面に遷移
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/main',
                  (route) => false,
                );
              },
              text: '認証する',
            ),
          ],
        ),
      ),
    );
  }
}
