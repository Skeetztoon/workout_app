import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/features/exercise_list/presentation/widgets/operation_alert_window.dart';
import 'package:workout_diary_bloc/models/exercise_model.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class ExerciseListTile extends StatefulWidget {
  const ExerciseListTile({super.key, required this.exercise});

  final Exercise exercise;

  @override
  State<ExerciseListTile> createState() => _ExerciseListTileState();
}

class _ExerciseListTileState extends State<ExerciseListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.lightGreyColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.exercise.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding: EdgeInsets.zero,
                        content: OperationAlertWindow(
                          operationType: OperationType.update,
                          buttonText: 'Change',
                          exercise: widget.exercise,
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding: EdgeInsets.zero,
                        content: OperationAlertWindow(
                          operationType: OperationType.delete,
                          buttonText: 'Delete',
                          exercise: widget.exercise,
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
