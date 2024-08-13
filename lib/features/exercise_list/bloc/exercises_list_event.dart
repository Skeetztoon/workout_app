part of 'exercises_list_bloc.dart';

abstract class ExercisesListEvent extends Equatable{
  const ExercisesListEvent();

  @override
  List<Object?> get props => [];
}

class LoadExerciseList extends ExercisesListEvent{}

class AddExercise extends ExercisesListEvent {

  final String title;

  const AddExercise({required this.title});

  @override
  List<Object?> get props => [title];
}

class RemoveExercise extends ExercisesListEvent {
  final Exercise exercise;

  const RemoveExercise({required this.exercise});

  @override
  List<Object?> get props => [exercise];
}

class UpdateExercise extends ExercisesListEvent {
  final Exercise exercise;

  const UpdateExercise({required this.exercise});
  @override
  List<Object?> get props => [exercise];
}
