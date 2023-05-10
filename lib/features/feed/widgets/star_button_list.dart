import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';

class StarButtonList extends StatelessWidget {
  final Function(int) onPressedCallback;

  const StarButtonList({Key? key, required this.onPressedCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _starButton(
          onPressed: () => onPressedCallback(1),
          iconSize: 36,
        ),
        _starButton(
          onPressed: () => onPressedCallback(2),
          iconSize: 36,
        ),
        _starButton(
          onPressed: () => onPressedCallback(3),
          iconSize: 36,
        ),
        _starButton(
          onPressed: () => onPressedCallback(4),
          iconSize: 36,
        ),
        _starButton(
          onPressed: () => onPressedCallback(5),
          iconSize: 36,
        ),
      ],
    );
  }

  _starButton({required VoidCallback onPressed, required double iconSize}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.star_outline,
        color: AppColors.white,
        size: iconSize,
      ),
    );
  }
}
