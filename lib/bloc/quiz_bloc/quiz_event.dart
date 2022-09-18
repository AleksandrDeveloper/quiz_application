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
  final BuildContext context;
  const NextQuizEvent({
    required this.context,
  });

  @override
  List<Object?> get props => [context];
}

class NewStartEvent extends QuizEvent{
  @override
  List<Object?> get props => [];

}
