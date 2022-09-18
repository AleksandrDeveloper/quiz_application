import 'package:flutter/material.dart';

class QuizAppButton extends StatelessWidget {
  final Color? colorText;
  final Color? colorButton;
  final String? title;
  final Function()? onTap;
  const QuizAppButton({
    Key? key,
    this.onTap,
    this.title,
    this.colorButton,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
        color: colorButton ?? theme.primaryColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              title ?? 'Нажми меня',
              style: theme.textTheme.headline5?.copyWith(color: colorText ?? Colors.white),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}