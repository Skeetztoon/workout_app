part of 'workouts_list_bloc.dart';

abstract class WorkoutsListState extends Equatable {
  const WorkoutsListState();
  @override
  List<Object> get props => [];
}

final class WorkoutsListInitial extends WorkoutsListState {}

class WorkoutsListLoaded extends WorkoutsListState {

  final List<Workout> workouts;

  const WorkoutsListLoaded({required this.workouts});

  @override
  List<Object> get props => [workouts];
}

