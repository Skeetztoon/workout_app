import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_diary_bloc/models/exercise_model.dart';

part 'exercises_list_event.dart';
part 'exercises_list_state.dart';

class ExercisesListBloc extends HydratedBloc<ExercisesListEvent, ExercisesListState> {
  ExercisesListBloc() : super(ExercisesListInitial()) {
    on<LoadExerciseList>((event, emit) {
      if (state is ExercisesListLoaded) {
        final state = this.state as ExercisesListLoaded;
        emit(ExercisesListLoaded(exercises: state.exercises));
      } else {
        emit(const ExercisesListLoaded(exercises: <Exercise>[]));
      }
    });

    on<AddExercise>((AddExercise event, Emitter emit) {
      if (state is ExercisesListLoaded) {
        final state = this.state as ExercisesListLoaded;
        List<Exercise> list = List.from(state.exercises)..add(Exercise(id: Uuid().v1(), title: event.title));
        emit(ExercisesListLoaded(exercises: list));
      }
    });
    on<RemoveExercise>((RemoveExercise event, Emitter emit) {
      if (state is ExercisesListLoaded) {
        final state = this.state as ExercisesListLoaded;
        List<Exercise> list = List.from(state.exercises)..remove(event.exercise);
        emit(ExercisesListLoaded(exercises: list));
      }
    });
    on<UpdateExercise>((UpdateExercise event, Emitter emit) {
      if (state is ExercisesListLoaded) {
        final state = this.state as ExercisesListLoaded;
        final updatedList = state.exercises.map((e) {
          return e.id==event.exercise.id ? event.exercise : e;
        }).toList();
        emit(ExercisesListLoaded(exercises: updatedList));
        }
      }
    );
  }

  @override
  ExercisesListState? fromJson(Map<String, dynamic> json) {
    try {
      final List<dynamic> listJson = json['exercisesList'];
      final List<Exercise> exercises = listJson.map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList();
      return ExercisesListLoaded(exercises: exercises);
    } catch (_) {
      return ExercisesListInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(ExercisesListState state) {
    if (state is ExercisesListLoaded) {
      final status = state;
      final List<dynamic>jsonList = status.exercises.map((exercise) => exercise.toJson()).toList();
      return {'exercisesList' : jsonList};
    }
    return null;
  }

  List<String> retrieveExercises(ExercisesListState state) {
  if (state is ExercisesListLoaded) {
    final state = this.state as ExercisesListLoaded;
    final List<String> list = state.exercises.map((e) => e.title).toList();
    return list;
  }
  return [];
  }
}