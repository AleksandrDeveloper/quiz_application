import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/quiz_bloc/quiz_bloc.dart';

import '../../modals/modals.dart';

class QuizCard extends StatelessWidget {
  final int index;
  final AnswersModal answer;
  const QuizCard({
    Key? key,
    required this.index,
    required this.answer,
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
          color: theme.cardColor,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                          child: Text(
                        '${index + 1}',
                        style: theme.textTheme.headline6
                            ?.copyWith(color: theme.backgroundColor),
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
                            color: theme.shadowColor,
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
                   final bloc = context.read<QuizBloc>();
                   bloc.add(NextQuizEvent());
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