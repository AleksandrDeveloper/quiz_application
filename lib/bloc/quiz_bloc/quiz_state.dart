part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final Quiz? quiz;
  final int currentQuiz;
  final String errorText;
  final bool isFinish;
  final List<AnswersModal> answers;

  const QuizState({
    this.quiz,
    this.errorText = '',
    this.currentQuiz = 1,
    this.isFinish = false,
    this.answers = const [],
  });

  QuizState copyWith({
    Quiz? quiz,
    int? currentQuiz,
    String? errorText,
    bool? isFinish,
    List<AnswersModal>? answers,
  }) {
    return QuizState(
      quiz: quiz ?? this.quiz,
      currentQuiz: currentQuiz ?? this.currentQuiz,
      errorText: errorText ?? this.errorText,
      isFinish: isFinish ?? this.isFinish,
      answers: answers ?? this.answers,
    );
  }

  @override
  List<Object> get props => [
        answers,
        errorText,
        currentQuiz,
        isFinish,
      ];
}
