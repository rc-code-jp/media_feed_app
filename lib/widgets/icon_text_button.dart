import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.text,
    this.margin = 5,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Icon icon;
  final Text text;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(AppColors.transparent),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(height: margin),
          Flexible(child: text),
        ],
      ),
    );
  }
}
