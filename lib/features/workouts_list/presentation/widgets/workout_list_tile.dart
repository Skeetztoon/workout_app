import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/models/workout_model.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class WorkoutListTile extends StatefulWidget {
  const WorkoutListTile({super.key, required this.workout});

  final Workout workout;

  @override
  State<WorkoutListTile> createState() => _WorkoutListTileState();
}

class _WorkoutListTileState extends State<WorkoutListTile> {
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
          Column(
            children: [
              Text(
                widget.workout.dateTime.toIso8601String(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                widget.workout.duration,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),

          const Icon(Icons.forward,)
        ],
      ),
    );
  }
}
