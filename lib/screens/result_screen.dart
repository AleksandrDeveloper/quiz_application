import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_application/bloc/result_bloc/result_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';
import '../uikit/uikit.dart';
import '../widgets/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const padding = 16.0;

    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        final listResult = state.listResult;
        return Scaffold(
          backgroundColor: AppColor.background,
          appBar: const QuizAppBar(
            title: 'Quiz Result',
            isStart: false,
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
                    SizedBox(
                      height: listResult.length * 140,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listResult.length,
                        itemBuilder: (context, index) {
                          final result = listResult[index];
                          return ResultCard(result: result);
                        },
                      ),
                    ),
                    QuizAppButton(
                      onTap: () {
                        final blocWelcome = context.read<WelcomeBloc>();
                        final blocQuiz = context.read<QuizBloc>();
                        blocWelcome.add(OnNewStartEvent());
                        blocQuiz.add(NewStartEvent());
                        Navigator.of(context).pushNamed('welcome');
                      },
                      colorText: AppColor.primary,
                      colorButton: AppColor.white,
                      title: 'Повторить',
                    ),
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
