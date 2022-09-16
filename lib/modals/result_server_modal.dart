import 'package:equatable/equatable.dart';

class ResultServer extends Equatable {
  final int? id;
  final DateTime dataQuiz;
  final DateTime timeStart;
  final DateTime? timeEnd;
  final String category;
  final String difficulty;
  final int? rightAnswer;
  final int? notRightAnswer;

  const ResultServer({
    this.id,
    required this.category,
    required this.dataQuiz,
    required this.difficulty,
    this.notRightAnswer,
    this.rightAnswer,
    this.timeEnd,
    required this.timeStart,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        dataQuiz,
        difficulty,
        notRightAnswer,
        rightAnswer,
        timeEnd,
        timeStart,
      ];
}
