part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final Quiz? quiz;
  final int currentQuiz;
  final String errorText;
  final bool isFinish;

  const QuizState({
    this.quiz,
    this.errorText = '',
    this.currentQuiz = 1,
    this.isFinish = false,
  });

  QuizState copyWith({
    Quiz? quiz,
    int? currentQuiz,
    String? errorText,
    bool? isFinish,
  }) {
    return QuizState(
      quiz: quiz ?? this.quiz,
      currentQuiz: currentQuiz ?? this.currentQuiz,
      errorText: errorText ?? this.errorText,
      isFinish: isFinish ?? this.isFinish,
    );
  }

  @override
  List<Object> get props => [
        errorText,
        currentQuiz,
        isFinish,
      ];
}
