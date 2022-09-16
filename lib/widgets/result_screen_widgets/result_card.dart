import 'package:flutter/material.dart';

import '../../modals/modals.dart';

class ResultCard extends StatelessWidget {
  final ResultUser result;

  const ResultCard({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    const padding = 16.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(padding),
        width: width,
        height: 120,
        decoration: BoxDecoration(
          color: result.isTrue ? theme.hintColor : theme.errorColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Center(
          child: Text(
            result.nameQuestion,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline6?.copyWith(
                fontSize: 17,
                color: result.isTrue ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
