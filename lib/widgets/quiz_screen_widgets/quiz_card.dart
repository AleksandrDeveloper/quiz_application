import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_application/bloc/result_bloc/result_bloc.dart';

import '../../modals/modals.dart';
import '../../uikit/uikit.dart';

class QuizCard extends StatelessWidget {
  final int index;
  final AnswersModal answer;
  final Quiz quiz;
  const QuizCard({
    Key? key,
    required this.index,
    required this.answer,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const padding = 16.0;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                          child: Text(
                        '${index + 1}',
                        style: theme.textTheme.headline6
                            ?.copyWith(color: AppColor.white),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: width - 124,
                        child: Text(
                          answer.answers ?? 'пусто',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.headline6?.copyWith(
                            color: AppColor.primary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    final blocQuiz = context.read<QuizBloc>();
                    final blocResult = context.read<ResultBloc>();

                    blocQuiz.add(NextQuizEvent(context: context));
                    blocResult.add(ResultUserEvent(
                      quiz: quiz,
                      context: context,
                      currentAnswer: answer,
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
