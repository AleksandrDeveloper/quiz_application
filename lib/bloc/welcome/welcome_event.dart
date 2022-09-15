part of 'welcome_bloc.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();
}

class SaveEvent extends WelcomeEvent {
  final String categoryName;
  final String difficultyName;

  const SaveEvent({
    required this.categoryName,
    required this.difficultyName,
  });

  @override
  List<Object?> get props => [
        categoryName,
        difficultyName,
      ];
}
