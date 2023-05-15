import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final InputDecoration? decoration;

  const FormTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Text(
                labelText!,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            obscureText: obscureText,
            cursorColor: AppColors.white,
            style: const TextStyle(color: AppColors.white),
            decoration: decoration ??
                InputDecoration(
                  hintText: hintText,
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
                ),
          ),
        ),
      ],
    );
  }
}
