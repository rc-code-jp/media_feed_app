import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/features/auth/widgets/sign_up_user_form.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';

class SignUpUserScreen extends ConsumerWidget {
  const SignUpUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('ユーザー情報登録'),
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      decoration: UtilStyles.decorationGradient,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignUpUserForm(),
        ],
      ),
    );
  }
}
