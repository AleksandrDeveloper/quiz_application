import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/configs/configs.dart';

import '../../modals/modals.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(const ResultState()) {
    on(_resultQuiz);
    on(_postResult);
  }
  List<ResultUser> listResult = [];
  var currentQuiz = 1;
  var correctAnswerResult = 0;
  var notCorrectAnswerResult = 0;
  final apiClient = ApiClient();

  Future<void> _resultQuiz(
    ResultUserEvent event,
    Emitter<ResultState> emit,
  ) async {
    currentQuiz += 1;
    final quiz = event.quiz;
    final currentAnswer = event.currentAnswer.name;
    final correctAnswer = quiz.correctAnswer;

    currentAnswer == correctAnswer
        ? correctAnswerResult += 1
        : notCorrectAnswerResult += 1;

    final currentResult = ResultUser(
      nameQuestion: quiz.question ?? '',
      currentAnswer: currentAnswer ?? '',
      correctAnswer: correctAnswer ?? '',
      isTrue: currentAnswer == correctAnswer ? true : false,
    );

    listResult.add(currentResult);
    if (currentQuiz == 10) {
      emit(state.copyWith(listResult: listResult));
    }
  }

  Future<void> _postResult(
    PostResultEvent event,
    Emitter<ResultState> emit,
  ) async {
    var resultServer = event.resultServer;
    final dataStartQuiz = resultServer?.dataQuiz.minute.toDouble();
    final dataEndQuiz = DateTime.now().minute.toDouble();
    if (currentQuiz == 10) {
      final resultDurationQuiz = dataStartQuiz! - dataEndQuiz;
      resultServer?.copyWith(
        durationQuiz: resultDurationQuiz,
        rightAnswer: correctAnswerResult,
        notRightAnswer: notCorrectAnswerResult,
      );

      await apiClient.postResult(result: resultServer!);
    }
  }
}
