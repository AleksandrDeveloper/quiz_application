import 'package:equatable/equatable.dart';

class ResultUser extends Equatable {
  final String nameQuestion;
  final String currentAnswer;
  final String correctAnswer;
  final bool isTrue;

  const ResultUser({
    required this.nameQuestion,
    required this.correctAnswer,
    required this.currentAnswer,
    required this.isTrue,
  });

  @override
  List<Object?> get props => [
        nameQuestion,
        correctAnswer,
        currentAnswer,
        isTrue,
      ];
}
