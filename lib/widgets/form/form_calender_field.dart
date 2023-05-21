import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';
import 'package:media_feed_app/widgets/form/form_label.dart';

class FormCalenderField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final FormFieldValidator<String>? validator;

  const FormCalenderField({
    Key? key,
    required this.controller,
    this.labelText,
    this.validator,
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
              validator: validator,
              cursorColor: AppColors.white,
              style: const TextStyle(color: AppColors.white),
              decoration: UtilStyles.fieldInputDecoration,
            ),
          ),
        ],
      ),
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
