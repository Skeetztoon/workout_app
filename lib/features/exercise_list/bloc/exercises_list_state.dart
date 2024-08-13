part of 'exercises_list_bloc.dart';

abstract class ExercisesListState extends Equatable {
  const ExercisesListState();
  @override
  List<Object> get props => [];

}

class ExercisesListInitial extends ExercisesListState {}

class ExercisesListLoaded extends ExercisesListState {

  final List<Exercise> exercises;

  const ExercisesListLoaded({required this.exercises});

  @override
  List<Object> get props => [exercises];
}

class ExercisesListError extends ExercisesListState {}
