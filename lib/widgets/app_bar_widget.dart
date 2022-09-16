import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isStart;
  final int? currentStep;
  const AppBarWidget({
    required this.title,
    required this.isStart,
    this.currentStep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 16.0;
    final width = MediaQuery.of(context).size.width - padding * 2;
    const height = 70.0;
    final theme = Theme.of(context);
    const duration = Duration(milliseconds: 250);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: padding * 2),
        child: AnimatedContainer(
          duration: duration,
          width: width,
          height: isStart! ? height - 30 : height,
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
          child: isStart
              ? StepProgressIndicator(
                  totalSteps: 10,
                  currentStep: currentStep ?? 0,
                  selectedColor: theme.backgroundColor,
                  unselectedColor: theme.focusColor,
                  roundedEdges: const Radius.circular(10),
                  size: 7,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.headline1?.copyWith(
                        color: theme.shadowColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
