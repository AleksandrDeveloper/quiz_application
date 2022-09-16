import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';

import '../../modals/modals.dart';

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
                  DropDownTextField(
                    singleController: _categoryController,
                    clearOption: false,
                    dropDownItemCount: 6,
                    dropDownList: dropdownCategory,
                    textFieldDecoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      labelStyle: theme.textTheme.bodyText1,
                      labelText: 'Тематика',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: DropDownTextField(
                      singleController: _difficultyController,
                      clearOption: false,
                      dropDownItemCount: 3,
                      dropDownList: difficultyCategory,
                      textFieldDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelStyle: theme.textTheme.bodyText1,
                        labelText: 'Уровень сложности',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                height: 60.0,
                decoration: BoxDecoration(
                  color: theme.shadowColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        'Поехали',
                        style: theme.textTheme.headline5
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => onSave(context),
                        ),
                      ),
                    ),
                  ],
                ),
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

  final difficultyCategory = [
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
