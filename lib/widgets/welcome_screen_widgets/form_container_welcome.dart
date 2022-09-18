import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';

import '../../modals/modals.dart';
import '../../uikit/uikit.dart';

class FormContainerWelcome extends StatefulWidget {
  const FormContainerWelcome({
    Key? key,
  }) : super(key: key);

  @override
  State<FormContainerWelcome> createState() => _FormContainerWelcomeState();
}

class _FormContainerWelcomeState extends State<FormContainerWelcome> {
  late SingleValueDropDownController _categoryController;
  late SingleValueDropDownController _difficultyController;

  @override
  void initState() {
    _categoryController = SingleValueDropDownController();
    _difficultyController = SingleValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const padding = 16.0;

    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Container(
          width: width,
          height: height / 2,
          padding: const EdgeInsets.symmetric(
              horizontal: padding, vertical: padding * 2),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Самое время начать',
                    style: theme.textTheme.headline1,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: state.processState == ProcessState.none ||
                              state.processState == ProcessState.fine
                          ? Text(
                              'Начнем с выбора тематики и сложности',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyText1,
                            )
                          : state.processState == ProcessState.error
                              ? Text(
                                  state.errorText,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyText1
                                      ?.copyWith(color: theme.errorColor),
                                )
                              : Container()),
                ],
              ),
              Column(
                children: [
                  QuizAppTextFieldDropdown(
                    controller: _categoryController,
                    listValue: dropdownCategory,
                    title: 'Тематика',
                    listValueLength: 6,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: QuizAppTextFieldDropdown(
                        controller: _difficultyController,
                        listValue: dropdownDifficulty,
                        title: 'Уровень сложности',
                        listValueLength: 3,
                      )),
                ],
              ),
              QuizAppButton(
                onTap: () => onSave(context),
                colorText: Colors.white,
                colorButton: theme.shadowColor,
                title: 'Поехали',
              ),
            ],
          ),
        );
      },
    );
  }

  final dropdownCategory = [
    const DropDownValueModel(name: 'Linux', value: "value1"),
    const DropDownValueModel(name: 'DevOps', value: "value1"),
    const DropDownValueModel(name: 'Networking', value: "value3"),
    const DropDownValueModel(name: 'Kubernetes', value: "value4"),
    const DropDownValueModel(name: 'Cloud', value: "value5"),
    const DropDownValueModel(name: 'Docker', value: "value6"),
  ];

  final dropdownDifficulty = [
    const DropDownValueModel(name: 'Easy', value: "value1"),
    const DropDownValueModel(name: 'Medium', value: "value2"),
    const DropDownValueModel(name: 'Hard', value: "value3"),
  ];

  void onSave(BuildContext context) {
    final blocWelcome = context.read<WelcomeBloc>();

    final categoryName = _categoryController.dropDownValue?.name;
    final difficultyName = _difficultyController.dropDownValue?.name;
    blocWelcome.add(SaveEvent(
        categoryName: categoryName ?? '',
        difficultyName: difficultyName ?? '',
        context: context));
  }
}

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
