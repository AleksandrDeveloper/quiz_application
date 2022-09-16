import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    const padding = 16.0;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBarWidget(title: 'Quiz Application', isStart: false, ),
    );
  }
}
