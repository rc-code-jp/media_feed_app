import 'package:flutter/material.dart';
import 'package:vuuum_app/styles/colors.dart';

class IconTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Icon icon;
  final Text text;
  final double? margin;

  const IconTextButton({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.text,
    this.margin = 5,
  }) : super(key: key);

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
