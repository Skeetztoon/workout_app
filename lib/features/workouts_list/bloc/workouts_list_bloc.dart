import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:workout_diary_bloc/models/workout_model.dart';

part 'workouts_list_event.dart';
part 'workouts_list_state.dart';

class WorkoutsListBloc extends HydratedBloc<WorkoutsListEvent, WorkoutsListState> {
  WorkoutsListBloc() : super(WorkoutsListInitial()) {
    on<LoadWorkouts>((event, emit) {
      if (state is WorkoutsListLoaded) {
        final state = this.state as WorkoutsListLoaded;
        emit(WorkoutsListLoaded(workouts: state.workouts));
      } else {
        emit(const WorkoutsListLoaded(workouts: <Workout>[]));
      }
    });

    on<AddWorkout>((event, emit) {
      if (state is WorkoutsListLoaded) {
        final state = this.state as WorkoutsListLoaded;
        final List<Workout>list  = List.from(state.workouts)..add(event.workout);
        emit(WorkoutsListLoaded(workouts: list));
      }
    });

    on<RemoveWorkout>((event, emit) {
      if (state is WorkoutsListLoaded) {
        final state = this.state as WorkoutsListLoaded;
        final List<Workout>list  = List.from(state.workouts)..remove(event.workout);
        emit(WorkoutsListLoaded(workouts: list));
      }
    });
  }

  @override
  WorkoutsListState? fromJson(Map<String, dynamic> json) {
    try {
      final List<dynamic> listJson = json['workoutsList'];
      final List<Workout> workouts = listJson.map((e) => Workout.fromJson(e as Map<String, dynamic>)).toList();
      return WorkoutsListLoaded(workouts: workouts);
    } catch (e) {
      return WorkoutsListInitial();
    }
  }

  @override
  Map<String, dynamic> toJson(WorkoutsListState state) {

      final status = state as WorkoutsListLoaded;
      final List<dynamic>jsonList = status.workouts.map((sessionExercise) => sessionExercise.toJson()).toList();
      return {'workoutsList' : jsonList};

  }
}
