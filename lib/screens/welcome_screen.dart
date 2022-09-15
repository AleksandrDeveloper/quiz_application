import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBarWidget(title: 'Quiz Application', isStart: false,),
      backgroundColor: theme.backgroundColor,
      body: Container(),
    );
  }
}
