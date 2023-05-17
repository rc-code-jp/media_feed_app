import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:media_feed_app/styles/colors.dart';

class FormDateField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  const FormDateField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.validator,
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
            onTap: () async {
              final currentDateTime = controller.text.isNotEmpty
                  ? DateTime.parse(controller.text)
                  : DateTime.now();
              final dateTime = await openCalendar(context, currentDateTime);
              // FIXME: 本体はInputFormatterを使った方が良い
              if (dateTime != null) {
                controller.text = DateFormat('yyyy-MM-dd').format(dateTime);
              } else {
                controller.text = '';
              }
            },
            readOnly: true,
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            cursorColor: AppColors.white,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
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

  Future<DateTime?> openCalendar(
    BuildContext context,
    DateTime? initialDate,
  ) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
  }
}
