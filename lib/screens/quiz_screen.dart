import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/quiz_bloc/quiz_bloc.dart';

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
    const padding = 16.0;

    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        final quiz = state.quiz;
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBarWidget(
            title: 'Мы начинаем',
            currentStep: state.currentQuiz,
            isStart: isStart,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              children: [
                Text(
                  quiz!.question ?? '',
                  style:
                      theme.textTheme.headline1?.copyWith(color: theme.cardColor, fontSize: 35),
                ),
                // ListView.builder(
                //     itemCount: quiz.answers,
                //     itemBuilder: (context, index){
                //   return
                // })
              ],
            ),
          ),
        );
      },
    );
  }
}
