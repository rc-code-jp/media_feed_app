import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/auth/widgets/sign_in_form.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: UtilStyles.decorationGradient,
        child: SafeArea(
          child: Column(
            children: const [SignInForm()],
          ),
        ),
      ),
    );
  }
}
