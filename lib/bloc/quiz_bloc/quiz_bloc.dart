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

  }
  final apiClient = ApiClient();
  var currentQuiz = 1;
  List<Quiz> listQuiz = [];
  List<AnswersModal> listAnswers = [];


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
    final mapAnswers = quiz.answers.toJson();
    mapAnswers
        .forEach((k, v) => listAnswers.add(AnswersModal(name: k, answers: v)));
    listAnswers.removeWhere((element) => element.answers == null);
    emit(state.copyWith(
        quiz: quiz, currentQuiz: currentQuiz, answers: listAnswers));
  }

  Future<void> _nextQuiz(
    NextQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    currentQuiz += 1;
    final quiz = listQuiz[currentQuiz];
    listAnswers.clear();
    final mapAnswers = quiz.answers.toJson();
    mapAnswers
        .forEach((k, v) => listAnswers.add(AnswersModal(name: k, answers: v)));
    listAnswers.removeWhere((element) => element.answers == null);
    emit(state.copyWith(
        quiz: quiz, currentQuiz: currentQuiz, answers: listAnswers));
    if (currentQuiz == 10) {
      emit(state.copyWith(isFinish: true));
    }
  }


}
