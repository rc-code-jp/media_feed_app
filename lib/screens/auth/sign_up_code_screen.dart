import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/features/auth/widgets/sign_up_code_form.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';

class SignUpCodeScreen extends ConsumerWidget {
  const SignUpCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('認証'),
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
          SignUpCodeForm(),
        ],
      ),
    );
  }
}
