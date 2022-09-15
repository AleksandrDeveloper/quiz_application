part of 'welcome_bloc.dart';

class WelcomeState extends Equatable {
  final ProcessState processState;
  final String errorText;

  const WelcomeState({
    this.errorText = '',
    this.processState = ProcessState.none,
  });

  WelcomeState copyWith({
    String? errorText,
    ProcessState? processState,
  }) {
    return WelcomeState(
      errorText: errorText ?? this.errorText,
      processState: processState ?? this.processState,
    );
  }

  @override
  List<Object?> get props => [
        errorText,
        processState,
      ];
}
