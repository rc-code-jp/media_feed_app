import 'package:flutter/material.dart';
import 'package:vuuum_app/models/form_select_item.dart';
import 'package:vuuum_app/styles/colors.dart';

class FormRadioField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final List<FormSelectItem> items;
  final void Function(String?) onChanged;

  const FormRadioField({
    Key? key,
    required this.controller,
    this.labelText,
    required this.items,
    required this.onChanged,
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
          child: Wrap(
            children: items.map((item) {
              return _radioItem(item.value, item.text);
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _radioItem(String value, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: controller.text,
          onChanged: onChanged,
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return (value == controller.text)
                ? AppColors.white
                : AppColors.white.withOpacity(0.5);
          }),
        ),
        GestureDetector(
          onTap: () {
            onChanged(value);
          },
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
            ),
          ),
        )
      ],
    );
  }
}
