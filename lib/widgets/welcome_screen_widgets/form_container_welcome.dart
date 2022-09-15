import 'package:flutter/material.dart';

class FormContainerWelcome extends StatelessWidget {
  const FormContainerWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const padding = 16.0;

    return Container(
      width: width,
      height: height / 2,
      padding: const EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
    );
  }
}