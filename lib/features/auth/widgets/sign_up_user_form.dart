import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/libraries/app_toast.dart';
import 'package:vuuum_app/models/form_select_item.dart';
import 'package:vuuum_app/widgets/form/action_button.dart';
import 'package:vuuum_app/widgets/form/form_date_field.dart';
import 'package:vuuum_app/widgets/form/form_radio_field.dart';

class SignUpUserForm extends ConsumerStatefulWidget {
  const SignUpUserForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends ConsumerState<SignUpUserForm> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final bdController = TextEditingController();
  final genderController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    focusNode.dispose();
    bdController.dispose();
    genderController.dispose();
    super.dispose();
  }

  void submit() async {
    focusNode.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      // 画面をすべて除いてメイン画面に遷移
      if (!mounted) return;
      await Navigator.pushNamedAndRemoveUntil(
        context,
        '/main',
        (route) => false,
      );
    } catch (e) {
      AppToast.showError('登録に失敗しました');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormDateField(
            labelText: '生年月日',
            controller: bdController,
          ),
          const SizedBox(
            height: 20,
          ),
          FormRadioField(
            controller: genderController,
            labelText: '性別',
            items: const [
              FormSelectItem(text: '男性', value: 'male'),
              FormSelectItem(text: '女性', value: 'female'),
              FormSelectItem(text: 'その他', value: 'they'),
            ],
            onChanged: (value) {
              setState(() {
                genderController.text = value ?? '';
              });
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ActionButton(
            onPressed: submit,
            text: '認証する',
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
