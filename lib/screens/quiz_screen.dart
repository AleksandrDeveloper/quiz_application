import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var isStart = false;
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isStart = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBarWidget(
        title: 'Мы начинаем',
        currentStep: 1,
        isStart: isStart,
      ),
    );
  }
}
