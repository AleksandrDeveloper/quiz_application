part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();
}

class ResultUserEvent extends ResultEvent {
  final Quiz quiz;
  final AnswersModal currentAnswer;
  final BuildContext context;
  const ResultUserEvent({
    required this.quiz,
    required this.currentAnswer,
    required this.context,
  });
  @override
  List<Object?> get props => [
        quiz,
        currentAnswer,
        context,
      ];
}

class PostResultEvent extends ResultEvent {
  final ResultServer resultServer;
  const PostResultEvent({
    required this.resultServer,
  });
  @override
  List<Object?> get props => [
        resultServer,
      ];
}
