import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/exercise_list/bloc/exercises_list_bloc.dart';
import 'package:workout_diary_bloc/models/exercise_model.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

enum OperationType { add, update, delete }
//ignore: must_be_immutable
class OperationAlertWindow extends StatefulWidget {
  OperationAlertWindow(
      {super.key,
      required this.operationType,
      required this.buttonText,
      this.exercise});

  final OperationType operationType;
  final String buttonText;
  Exercise? exercise;

  @override
  State<OperationAlertWindow> createState() => _OperationAlertWindowState();
}

class _OperationAlertWindowState extends State<OperationAlertWindow> {
  final _formKey = GlobalKey<FormState>();
  late String exerciseLabel;

  @override
  void initState() {
    exerciseLabel = widget.exercise != null ? widget.exercise!.title : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 230,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        border: Border.all(width: 10, color: MyColors.darkGreyColor),
        color: MyColors.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: (widget.operationType != OperationType.delete)
            ? <Widget>[
                Form(
                  key: _formKey,
                  child: TextFormField(
                    initialValue: (widget.operationType == OperationType.update)
                        ? widget.exercise!.title
                        : '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        hintText: "Type your exercise here",
                        hintStyle: TextStyle(color: Colors.grey)),
                    onChanged: (value) {
                      exerciseLabel = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is empty";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (widget.operationType == OperationType.add) {
                          context
                              .read<ExercisesListBloc>()
                              .add(AddExercise(title: exerciseLabel));
                        } else {
                          context.read<ExercisesListBloc>().add(UpdateExercise(
                              exercise: Exercise(
                                  id: widget.exercise!.id,
                                  title: exerciseLabel)));
                        }
                      } else {
                        context
                            .read<ExercisesListBloc>()
                            .add(RemoveExercise(exercise: widget.exercise!));
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      widget.buttonText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyColors.whiteColor),
                    ),
                  ),
                )
              ]
            : <Widget>[
                Text(
                  'Do you want to delete exercise?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyColors.whiteColor),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<ExercisesListBloc>()
                        .add(RemoveExercise(exercise: widget.exercise!));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: MyColors.whiteColor),
                  ),
                )
              ],
      ),
    );
  }
}
