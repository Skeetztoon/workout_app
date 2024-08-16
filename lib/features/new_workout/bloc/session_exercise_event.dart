part of 'session_exercise_bloc.dart';

abstract class SessionExerciseEvent extends Equatable {
  const SessionExerciseEvent();
  @override
  List<Object?> get props => [];
}

class ChangeTitle extends SessionExerciseEvent {
  final int index;
  final String title;

  const ChangeTitle({required this.index, required this.title});
}

class ChangeRepsSetsLoad extends SessionExerciseEvent {
  final int index;
  final int sets;
  final int reps;
  final int load;

  const ChangeRepsSetsLoad({required this.index, required this.sets, required this.reps, required this.load});
}

class AddSessionExercise extends SessionExerciseEvent {

  final SessionExercise exercise;

  const AddSessionExercise({required this.exercise});
}
class ResetState extends SessionExerciseEvent {}
