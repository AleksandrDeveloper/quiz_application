import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../modals/modals.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState()) {
    on(_onSave);
  }
  Future<void> _onSave(
    SaveEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    final categoryName = event.categoryName;
    final difficultyName = event.difficultyName;
    if (categoryName.isEmpty && difficultyName.isEmpty) {
      emit(state.copyWith(
          processState: ProcessState.error,
          errorText: 'Нужно выбрать тематику и сложность'));
      return;
    }
    if (categoryName.isEmpty) {
      emit(state.copyWith(
          processState: ProcessState.error,
          errorText: 'Нужно выбрать тематику'));
      return;
    }
    if (difficultyName.isEmpty) {
      emit(state.copyWith(
          processState: ProcessState.error,
          errorText: 'Нужно выбрать сложность'));
      return;
    }
    if (categoryName.isNotEmpty && difficultyName.isNotEmpty) {
      emit(state.copyWith(processState: ProcessState.fine, isStart: true));
    }
  }
}
