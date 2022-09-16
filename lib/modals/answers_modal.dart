import 'package:equatable/equatable.dart';

class AnswersModal extends Equatable {
  final String? name;
  final String? answers;
  const AnswersModal({
      this.name,
      this.answers,
  });

  @override
  List<Object?> get props => [
        name,
        answers,
      ];
}
