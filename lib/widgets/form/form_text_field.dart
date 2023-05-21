import 'package:flutter/material.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';
import 'package:vuuum_app/widgets/form/form_label.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  const FormTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabel(
            text: labelText,
          ),
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
              decoration: UtilStyles.fieldInputDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
