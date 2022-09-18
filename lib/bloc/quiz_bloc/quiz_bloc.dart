import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/result_bloc/result_bloc.dart';
import 'package:quiz_application/modals/answers_modal.dart';

import '../../configs/configs.dart';
import '../../modals/modals.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on(_fetchQuiz);
    on(_nextQuiz);
    on(_newStart);
  }
  final apiClient = ApiClient();
  var currentQuiz = 1;
  List<Quiz> listQuiz = [];
  late final ResultServer resultServer;

  Future<void> _fetchQuiz(
    FetchQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    final categoryName = event.categoryName;
    final difficultyName = event.difficultyName;
    final listQuizJson = await apiClient.fetchQuiz(
        category: categoryName, difficulty: difficultyName);

    listQuiz.addAll(listQuizJson);
    final quiz = listQuiz[currentQuiz];

    final listAnswers = await _getListAnswer(quiz: quiz);

    resultServer = ResultServer(
        category: categoryName,
        difficulty: difficultyName,
        dataQuiz: DateTime.now());

    emit(state.copyWith(
        quiz: quiz, currentQuiz: currentQuiz, answers: listAnswers));
  }

  Future<void> _nextQuiz(
    NextQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    final blocResult = event.context.read<ResultBloc>();
    currentQuiz += 1;
    final quiz = listQuiz[currentQuiz];
    final listAnswers = await _getListAnswer(quiz: quiz);

    emit(state.copyWith(
        quiz: quiz, currentQuiz: currentQuiz, answers: listAnswers));

    if (currentQuiz == 10) {
      emit(state.copyWith(isFinish: true));
      blocResult.add(PostResultEvent(resultServer: resultServer));
      resultServer.copyWith();
    }
  }

  Future<void> _newStart(
    NewStartEvent event,
    Emitter<QuizState> emit,
  ) async {
    currentQuiz = 1;
    listQuiz.clear();
    emit(state.copyWith(isFinish: false, currentQuiz: currentQuiz));
  }

  Future<List<AnswersModal>> _getListAnswer({
    required Quiz quiz,
  }) async {
    List<AnswersModal> listAnswers = [];
    listAnswers.clear();
    final mapAnswers = quiz.answers.toJson();
    mapAnswers
        .forEach((k, v) => listAnswers.add(AnswersModal(name: k, answers: v)));
    listAnswers.removeWhere((element) => element.answers == null);
    return listAnswers;
  }
}
