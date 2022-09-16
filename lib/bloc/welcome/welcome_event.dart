part of 'welcome_bloc.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();
}

class SaveEvent extends WelcomeEvent {
  final String categoryName;
  final String difficultyName;
  final BuildContext context;

  const SaveEvent({
    required this.categoryName,
    required this.difficultyName,
    required this.context,
  });

  @override
  List<Object?> get props => [
        categoryName,
        difficultyName,
        context,
      ];
}

class OnStartEvent extends WelcomeEvent {
  @override
  List<Object?> get props => [];
}
