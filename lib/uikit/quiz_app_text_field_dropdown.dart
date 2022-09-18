import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'uikit.dart';

class QuizAppTextFieldDropdown extends StatelessWidget {
  final String? title;
  final SingleValueDropDownController controller;
  final List<DropDownValueModel>? listValue;
  final int? listValueLength;

  const QuizAppTextFieldDropdown({
    Key? key,
    this.title,
    this.listValueLength,
    required SingleValueDropDownController controller,
    required this.listValue,
  })  : controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropDownTextField(
      singleController: controller,
      clearOption: false,
      dropDownItemCount: listValueLength ?? 1,
      dropDownList: listValue ?? [],
      textFieldDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            width: 3,
            color: AppColor.background,
          ),
        ),
        labelStyle: theme.textTheme.bodyText1,
        labelText: title,
      ),
    );
  }
}