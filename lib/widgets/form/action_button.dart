import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool? isLoading;

  const ActionButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: Colors.white.withOpacity(0.2),
          disabledForegroundColor: Colors.white.withOpacity(0.8),
          disabledBackgroundColor: Colors.grey.withOpacity(0.2),
          shadowColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        child: isLoading!
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2.0,
                ),
              )
            : Text(text),
      ),
    );
  }
}
