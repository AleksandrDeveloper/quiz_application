import 'package:equatable/equatable.dart';

class ResultServer extends Equatable {
  final DateTime dataQuiz;
  final double? durationQuiz;
  final String category;
  final String difficulty;
  final int? rightAnswer;
  final int? notRightAnswer;

  const ResultServer({
    required this.category,
    required this.dataQuiz,
    required this.difficulty,
    this.notRightAnswer,
    this.rightAnswer,
    this.durationQuiz,
  });

  @override
  List<Object?> get props => [
        category,
        dataQuiz,
        difficulty,
        notRightAnswer,
        rightAnswer,
        durationQuiz,
      ];
}
