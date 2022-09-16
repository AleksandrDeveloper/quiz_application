import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../configs/configs.dart';
import '../../modals/modals.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on(_fetchQuiz);
    on(_nextQuiz);
    on(_postQuiz);
  }
  final apiClient = ApiClient();
  var currentQuiz = 1;
  List<Quiz> listQuiz = [];


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
    print('это первый вопрос  ${quiz.question}');
    emit(state.copyWith(quiz: quiz, currentQuiz: currentQuiz));
  }

  Future<void> _nextQuiz(
    NextQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    currentQuiz + 1;
    print(currentQuiz);
    final quiz = listQuiz[currentQuiz];
    emit(state.copyWith(quiz: quiz, currentQuiz: currentQuiz));
  }

  Future<void> _postQuiz(
    PostQuizEvent event,
    Emitter<QuizState> emit,
  ) async {}
}
