import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/features/auth/widgets/sign_up_form.dart';
import 'package:media_feed_app/styles/utils.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: UtilStyles.boxGradient,
        child: SafeArea(
          child: Column(
            children: const [SignUpForm()],
          ),
        ),
      ),
    );
  }
}