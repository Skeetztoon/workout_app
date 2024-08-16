import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_diary_bloc/features/workouts_list/presentation/workout_session_page.dart';
import 'package:workout_diary_bloc/models/workout_model.dart';
import 'package:workout_diary_bloc/theme/colors.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

class WorkoutListTile extends StatefulWidget {
  const WorkoutListTile({super.key, required this.workout});

  final Workout workout;

  @override
  State<WorkoutListTile> createState() => _WorkoutListTileState();
}

class _WorkoutListTileState extends State<WorkoutListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutSessionPage(workout: widget.workout)));
      },
      child: Container(
        padding: MyPadding.tilePadding,
        decoration: BoxDecoration(
          color: MyColors.lightGreyColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
        DateFormat('dd/MM/yyyy').format(widget.workout.dateTime),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  widget.workout.duration,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            const Icon(Icons.arrow_forward_ios,)
          ],
        ),
      ),
    );
  }
}
