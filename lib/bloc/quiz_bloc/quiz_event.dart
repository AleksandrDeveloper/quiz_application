part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class FetchQuizEvent extends QuizEvent {
  final String categoryName;
  final String difficultyName;
  const FetchQuizEvent({
    required this.categoryName,
    required this.difficultyName,
  });
  @override
  List<Object?> get props => [
        categoryName,
        difficultyName,
      ];
}

class NextQuizEvent extends QuizEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}


