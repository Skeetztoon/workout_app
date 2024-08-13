part of 'workouts_list_bloc.dart';

abstract class WorkoutsListEvent extends Equatable {
  const WorkoutsListEvent();
  @override
  List<Object> get props => [];
}

class LoadWorkouts extends WorkoutsListEvent {}

class AddWorkout extends WorkoutsListEvent {
  final Workout workout;

  const AddWorkout({required this.workout});

  @override
  List<Object> get props => [];
}

class RemoveWorkout extends WorkoutsListEvent {
  final Workout workout;

  const RemoveWorkout({required this.workout});

  @override
  List<Object> get props => [];
}
