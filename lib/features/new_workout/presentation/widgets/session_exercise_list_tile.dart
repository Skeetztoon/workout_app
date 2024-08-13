import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:workout_diary_bloc/features/exercise_list/bloc/exercises_list_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/exercise_dropdown_button.dart';
import 'package:workout_diary_bloc/features/new_workout/session_exercise/session_exercise_bloc.dart';

class SessionExerciseListTile extends StatefulWidget {
  const SessionExerciseListTile({super.key, required this.index});

  final int index;

  @override
  State<SessionExerciseListTile> createState() =>
      _SessionExerciseListTileState();
}

class _SessionExerciseListTileState extends State<SessionExerciseListTile> {
  int _currentReps = 10;
  int _currentSets = 3;
  int _currentLoad = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<ExercisesListBloc, ExercisesListState>(
          builder: (context, state) {
            if (state is ExercisesListLoaded) {
              List<String> list = ExercisesListBloc()
                  .retrieveExercises(state as ExercisesListLoaded);
              return ExerciseDropdownButton(index: widget.index, exercises: list);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        _rslCounter(),
      ],
    );
  }

  Widget _rslCounter() {
    return Row(
      children: [
        SizedBox(
          width: 35,
          child: NumberPicker(
              minValue: 1,
              maxValue: 30,
              itemHeight: 33,
              value: _currentReps,
              textStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              selectedTextStyle: const TextStyle(fontSize: 30),
              onChanged: (value) {
                setState(() {
                  _currentReps = value;
                });
                context.read<SessionExerciseBloc>().add(ChangeRepsSetsLoad(index: widget.index, sets: _currentSets, reps: _currentReps, load: _currentLoad));
              }),
        ),
        SizedBox(
          width: 35,
          child: NumberPicker(
              minValue: 1,
              maxValue: 30,
              itemHeight: 33,
              value: _currentSets,
              textStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),
              selectedTextStyle: const TextStyle(fontSize: 30),
              onChanged: (value) {
                setState(() {
                  _currentSets = value;
                });
                context.read<SessionExerciseBloc>().add(ChangeRepsSetsLoad(index: widget.index, sets: _currentSets, reps: _currentReps, load: _currentLoad));
              }),
        ),
        SizedBox(
          width: (_currentLoad < 100) ? 35 : 52,
          child: NumberPicker(
              minValue: 0,
              maxValue: 300,
              itemHeight: 33,
              value: _currentLoad,
              textStyle: TextStyle(
                  color: Colors.white
                      .withOpacity((_currentLoad == 0) ? 0.0 : 0.5)),
              selectedTextStyle: const TextStyle(fontSize: 30),
              onChanged: (value) {
                setState(() {
                  _currentLoad = value;
                });
                context.read<SessionExerciseBloc>().add(ChangeRepsSetsLoad(index: widget.index, sets: _currentSets, reps: _currentReps, load: _currentLoad));
              }),
        ),
      ],
    );
  }
}
