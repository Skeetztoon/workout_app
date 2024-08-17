import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:workout_diary_bloc/core/extentions/build_context_extention.dart';
import 'package:workout_diary_bloc/core/widgets/bounce_button.dart';
import 'package:workout_diary_bloc/core/widgets/small_back_button.dart';
import 'package:workout_diary_bloc/core/widgets/wide_button.dart';
import 'package:workout_diary_bloc/models/session_exercise.dart';
import 'package:workout_diary_bloc/models/workout_model.dart';
import 'package:workout_diary_bloc/theme/colors.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

class WorkoutSessionPage extends StatefulWidget {
  const WorkoutSessionPage({super.key, required this.workout});

  final Workout workout;

  @override
  State<WorkoutSessionPage> createState() => _WorkoutSessionPageState();
}

class _WorkoutSessionPageState extends State<WorkoutSessionPage> {
  @override
  Widget build(BuildContext context) {
    List<SessionExercise> exercises = widget.workout.exercises;
    return Scaffold(
      body: Padding(
        padding: MyPadding.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              context.locale!.workout,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              DateFormat('dd/MM/yyyy').format(widget.workout.dateTime),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 20.0,
                        offset: Offset(5, 5),
                        color: Colors.black87)
                  ],
                ),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      SessionExercise exercise = exercises[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              exercise.title ?? '---',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                            Text(
                                '${exercise.reps}x${exercise.sets}${(exercise.load != 0) ? ' ${exercise.load}${context.locale!.kg}' : ''}'),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                BounceButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SmallBackButton()),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: BounceButton(
                    onTap: () async {
                      String message =
                          '${context.locale!.mySessionExportText}\n${context.locale!.duration}: ${widget.workout.duration}\n';
                      for (var exercise in widget.workout.exercises) {
                        message +=
                            '${exercise.title} ${exercise.reps}x${exercise.sets} ${exercise.load > 0 ? exercise.load : ''}\n';
                      }
                      message += 'https://www.cocu.bebru/xyz';
                      await Share.share(message);
                    },
                    child: WideButton(
                      color: MyColors.activeColor,
                      text: context.locale!.share,
                      textColor: MyColors.whiteColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
