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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        quiz!.question ?? '',
                        style: theme.textTheme.headline1
                            ?.copyWith(color: theme.cardColor, fontSize: 35),
                      ),
                    ),
                    SizedBox(
                      // width: width,
                      height: height - 250,
                      child: ListView.builder(
                          itemCount: state.answers.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                width: width,
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: padding),
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Center(child: Text('${index + 1}', style: theme.textTheme.headline6?.copyWith(color: theme.backgroundColor),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Expanded(
                                        child: Text(
                                          state.answers[index].answers ?? 'пусто',
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.headline5
                                              ?.copyWith(
                                                  color: theme.shadowColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
