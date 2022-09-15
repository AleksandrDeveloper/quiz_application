part of 'welcome_bloc.dart';

class WelcomeState extends Equatable {
  final ProcessState processState;
  final String errorText;
  final bool isStart;

  const WelcomeState({
    this.errorText = '',
    this.processState = ProcessState.none,
    this.isStart = false,
  });

  WelcomeState copyWith({
    String? errorText,
    ProcessState? processState,
    bool? isStart,
  }) {
    return WelcomeState(
      errorText: errorText ?? this.errorText,
      processState: processState ?? this.processState,
      isStart: isStart ?? this.isStart
    );
  }

  @override
  List<Object?> get props => [
        errorText,
        processState,
      ];
}
