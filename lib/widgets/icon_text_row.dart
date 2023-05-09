import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  final Icon icon;
  final Text text;
  final double margin;

  const IconTextRow({
    Key? key,
    required this.icon,
    required this.text,
    this.margin = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        text
      ],
    );
  }
}
