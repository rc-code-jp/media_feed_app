import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';

class UtilStyles {
  static const BoxDecoration decorationGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.linearGradient1,
        AppColors.linearGradient2,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static BoxDecoration decorationGlass = BoxDecoration(
    color: AppColors.white.withOpacity(0.2),
    borderRadius: BorderRadius.circular(10),
  );

  static InputDecoration fieldInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: AppColors.white.withOpacity(0.3),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.white.withOpacity(0.3),
      ),
    ),
    labelStyle: const TextStyle(color: AppColors.white),
    filled: true,
    fillColor: AppColors.white.withOpacity(0.2),
    counterText: '',
  );
}
