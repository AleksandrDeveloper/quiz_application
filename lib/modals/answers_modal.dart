import 'package:equatable/equatable.dart';

class Answers extends Equatable {
  final String name;
  final String answers;
  const Answers({
    required this.name,
    required this.answers,
  });

  @override
  List<Object?> get props => [
        name,
        answers,
      ];
}
