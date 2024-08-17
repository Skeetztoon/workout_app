import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/core/extentions/build_context_extention.dart';
import 'package:workout_diary_bloc/features/new_workout/bloc/session_exercise_bloc.dart';

class ExerciseDropdownButton extends StatefulWidget {
  const ExerciseDropdownButton({super.key, required this.exercises, required this.index});

  final int index;
  final List<String> exercises;

  @override
  State<ExerciseDropdownButton> createState() => _ExerciseDropdownButtonState();
}

class _ExerciseDropdownButtonState extends State<ExerciseDropdownButton> {

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: DropdownButton(
        itemHeight: 65,
        isExpanded: true,
        hint: Text(context.locale!.tapToChoose, style: Theme.of(context).textTheme.bodyMedium,),
        style: Theme.of(context).textTheme.bodyMedium,
        alignment: Alignment.centerLeft,
        value: dropdownValue,
        items: widget.exercises.map<DropdownMenuItem<String>>( (String value) => DropdownMenuItem<String>(value: value, child: Text(value,) ,)).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
          context.read<SessionExerciseBloc>().add(ChangeTitle(index: widget.index, title: dropdownValue!));
        },
      ),
    );
  }
}
