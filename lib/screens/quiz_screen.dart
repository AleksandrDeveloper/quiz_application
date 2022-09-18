import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_application/configs/configs.dart';
import '../uikit/uikit.dart';
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
        if (state.isFinish == false) {
          return Scaffold(
            backgroundColor: AppColor.background,
            appBar: QuizAppBar(
              title: 'Мы начинаем',
              currentStep: state.currentQuiz,
              isStart: isStart,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding,
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                        child: Text(
                          quiz!.question ?? '',
                          style: theme.textTheme.headline1
                              ?.copyWith(color: AppColor.white, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        // width: width,
                        height: state.answers.length * 120,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.answers.length,
                          itemBuilder: (context, index) {
                            return QuizCard(
                              index: index,
                              answer: state.answers[index],
                              quiz: quiz,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SplashScreen(
            title: 'Теперь наши ученые проверят твои ответы',
            image: AppImages.result,
            navigator: 'result',
          );
        }
      },
    );
  }
}
