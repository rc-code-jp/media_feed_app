import 'package:flutter/material.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';
import 'package:media_feed_app/widgets/form/form_label.dart';

class FormDateField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final FormFieldValidator<String>? validator;

  const FormDateField({
    Key? key,
    required this.controller,
    this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FormDateFieldState();
}

class FormDateFieldState extends State<FormDateField> {
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    yearController.dispose();
    monthController.dispose();
    dayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabel(
            text: widget.labelText,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: TextFormField(
                  controller: yearController,
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.white,
                  style: const TextStyle(color: AppColors.white),
                  decoration: UtilStyles.fieldInputDecoration,
                  maxLength: 4,
                  onChanged: (value) {
                    updateValue(value);
                    // 次のinputにフォーカスを移す
                    if (value.length == 4) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('年', style: TextStyle(color: AppColors.white)),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  controller: monthController,
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.white,
                  style: const TextStyle(color: AppColors.white),
                  decoration: UtilStyles.fieldInputDecoration,
                  maxLength: 2,
                  onChanged: (value) {
                    updateValue(value);
                    // 次のinputにフォーカスを移す
                    if (value.length == 2) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('月', style: TextStyle(color: AppColors.white)),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  controller: dayController,
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.white,
                  style: const TextStyle(color: AppColors.white),
                  decoration: UtilStyles.fieldInputDecoration,
                  maxLength: 2,
                  onChanged: (value) {
                    updateValue(value);
                    // フォーカスを外す
                    if (value.length == 2) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('日', style: TextStyle(color: AppColors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 値を更新する
  void updateValue(String value) {
    String year = yearController.text;
    String month = monthController.text;
    String day = dayController.text;
    widget.controller.text = '$year-$month-$day';
  }
}
