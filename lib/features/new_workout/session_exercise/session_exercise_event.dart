part of 'session_exercise_bloc.dart';

abstract class SessionExerciseEvent extends Equatable {
  const SessionExerciseEvent();
}

class ChangeTitle extends SessionExerciseEvent {
  final int index;
  final String title;

  const ChangeTitle({required this.index, required this.title});

  @override
  List<Object?> get props => [index, title];
}

class ChangeRepsSetsLoad extends SessionExerciseEvent {
  final int index;
  final int sets;
  final int reps;
  final int load;

  const ChangeRepsSetsLoad({required this.index, required this.sets, required this.reps, required this.load});

  @override
  List<Object?> get props => [index, sets, reps, load];
}

class AddSessionExercise extends SessionExerciseEvent {

  final SessionExercise exercise;

  const AddSessionExercise({required this.exercise});

  @override
  List<Object?> get props => [];
}

