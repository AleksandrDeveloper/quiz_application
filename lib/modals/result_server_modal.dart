import 'package:equatable/equatable.dart';

class ResultServer extends Equatable {
  final DateTime dataQuiz;
  final int? durationQuiz;
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

  ResultServer copyWith({
    DateTime? dataQuiz,
    int? durationQuiz,
    String? category,
    String? difficulty,
    int? rightAnswer,
    int? notRightAnswer,
  }) {
    return ResultServer(
      dataQuiz: dataQuiz ?? this.dataQuiz,
      durationQuiz: durationQuiz ?? this.durationQuiz,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      rightAnswer: rightAnswer ?? this.rightAnswer,
      notRightAnswer: notRightAnswer ?? this.notRightAnswer,
    );
  }

  Map<String, dynamic> toJson() => {
        "dataQuiz": dataQuiz,
        "durationQuiz": durationQuiz,
        "category": category,
        "difficulty": difficulty,
        "rightAnswer": rightAnswer,
        "notRightAnswer": notRightAnswer,
      };

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
