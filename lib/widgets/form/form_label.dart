import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';

class FormLabel extends StatelessWidget {
  final String? text;

  const FormLabel({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != null
        ? Text(
            text!,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          )
        : const SizedBox.shrink();
  }
}
