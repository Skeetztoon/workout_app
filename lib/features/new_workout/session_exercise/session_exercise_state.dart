part of 'session_exercise_bloc.dart';

abstract class SessionExerciseState extends Equatable {
  const SessionExerciseState();
  @override
  List<Object> get props => [];
}

class SessionExerciseInitial extends SessionExerciseState {
  List<SessionExercise> sessionExercises;

  SessionExerciseInitial({required this.sessionExercises});

  @override
  List<Object> get props => [sessionExercises];
}
