import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/models/session_exercise.dart';

part 'session_exercise_event.dart';
part 'session_exercise_state.dart';

class SessionExerciseBloc extends Bloc<SessionExerciseEvent, SessionExerciseState> {
  SessionExerciseBloc() : super(SessionExerciseInitial(sessionExercises: <SessionExercise>[SessionExercise()])) {
    on<ChangeTitle>((ChangeTitle event,Emitter emit) {
      final List<SessionExercise> list = (state as SessionExerciseInitial).sessionExercises;
      list[event.index].title=event.title;
      emit(SessionExerciseInitial(sessionExercises: list));
    });
    on<ChangeRepsSetsLoad>((ChangeRepsSetsLoad event,Emitter emit) {
      final List<SessionExercise> list = (state as SessionExerciseInitial).sessionExercises;
      list[event.index].reps=event.reps;
      list[event.index].sets=event.sets;
      list[event.index].load=event.load;
      emit(SessionExerciseInitial(sessionExercises: list));
    });
    on<AddSessionExercise>((AddSessionExercise event, Emitter emit) {
      final List<SessionExercise> list = (state as SessionExerciseInitial).sessionExercises;
      emit(SessionExerciseInitial(sessionExercises: list..add(event.exercise)));
    });


  }
  //
  // List<SessionExercise> retrieveList() {
  // return (state as SessionExerciseInitial).sessionExercises;
  // }
}
