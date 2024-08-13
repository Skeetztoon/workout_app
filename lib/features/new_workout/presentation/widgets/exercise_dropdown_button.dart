import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/session_exercise/session_exercise_bloc.dart';

class ExerciseDropdownButton extends StatefulWidget {
  const ExerciseDropdownButton({super.key, required this.exercises, required this.index});

  final int index;
  final List<String> exercises;

  @override
  State<ExerciseDropdownButton> createState() => _ExerciseDropdownButtonState();
}

class _ExerciseDropdownButtonState extends State<ExerciseDropdownButton> {

 late  String dropdownValue;

 @override
  void initState() {
    super.initState();
    setState(() {
      dropdownValue = widget.exercises.first;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      items: widget.exercises.map<DropdownMenuItem<String>>( (String value) => DropdownMenuItem<String>(value: value, child: Text(value),)).toList(),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
        context.read<SessionExerciseBloc>().add(ChangeTitle(index: widget.index, title: dropdownValue));
      },
    );
  }
}
