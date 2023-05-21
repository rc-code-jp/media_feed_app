import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/styles/colors.dart';

class StarButtonList extends ConsumerStatefulWidget {
  final Function(int) onPressedCallback;

  const StarButtonList({Key? key, required this.onPressedCallback})
      : super(key: key);

  @override
  StarButtonListState createState() => StarButtonListState();
}

class StarButtonListState extends ConsumerState<StarButtonList> {
  List buttonNumberList = <int>[1, 2, 3, 4, 5];
  int pressedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttonNumberList
          .map(
            (number) => _starButton(
              onPressed: () {
                widget.onPressedCallback(number);
                setState(() {
                  pressedNumber = number;
                });
              },
              iconSize: 39,
              filled: pressedNumber >= number,
            ),
          )
          .toList(),
    );
  }

  Widget _starButton({
    required VoidCallback onPressed,
    required double iconSize,
    required bool filled,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        filled ? Icons.star : Icons.star_outline,
        color: AppColors.white,
        size: iconSize,
      ),
    );
  }
}
