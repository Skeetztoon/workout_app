import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/models/session_exercise.dart';

part 'session_exercise_event.dart';
part 'session_exercise_state.dart';

class SessionExerciseBloc
    extends Bloc<SessionExerciseEvent, SessionExerciseState> {
  SessionExerciseBloc()
      : super(SessionExerciseInitial(
          sessionExercises: <SessionExercise>[SessionExercise(),],
        )) {
    on<ChangeTitle>((ChangeTitle event, Emitter emit) {
      final state = this.state as SessionExerciseInitial;
      final List<SessionExercise> list = List.from(state.sessionExercises);
      list[event.index].title = event.title;
      emit(SessionExerciseInitial(
          sessionExercises: list,));
    });
    on<ChangeRepsSetsLoad>((ChangeRepsSetsLoad event, Emitter emit) {
      final state = this.state as SessionExerciseInitial;
      final List<SessionExercise> list = List.from(state.sessionExercises);
      list[event.index].reps = event.reps;
      list[event.index].sets = event.sets;
      list[event.index].load = event.load;
      emit(SessionExerciseInitial(
          sessionExercises: list));
    });
    on<AddSessionExercise>((AddSessionExercise event, Emitter emit) {
      final state = this.state as SessionExerciseInitial;
      List<SessionExercise> list = List.from(state.sessionExercises)
        ..add(event.exercise);
      emit(SessionExerciseInitial(
          sessionExercises: list));
    });

    on<RemoveLastExercise>((RemoveLastExercise event, Emitter emit) {
      final state = this.state as SessionExerciseInitial;
      List<SessionExercise> list = List.from(state.sessionExercises);
      if (list.isNotEmpty) {
        list.removeLast();
      }
      emit(SessionExerciseInitial(sessionExercises: list));
    });

    on<ResetState>((ResetState event, Emitter emit) {
      emit(SessionExerciseInitial(
          sessionExercises: [SessionExercise()]));
    });
  }
}
