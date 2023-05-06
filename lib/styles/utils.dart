import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';

class UtilStyles {
  static const boxGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.linearGradient1,
        AppColors.linearGradient2,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
