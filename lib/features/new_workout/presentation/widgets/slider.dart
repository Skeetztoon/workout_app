import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:intl/intl.dart';
import 'package:workout_diary_bloc/core/exceptions/session_list_exception.dart';
import 'package:workout_diary_bloc/core/extentions/build_context_extention.dart';
import 'package:workout_diary_bloc/features/new_workout/bloc/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/stopwatch_cubit/stopwatch_cubit.dart';
import 'package:workout_diary_bloc/features/workouts_list/bloc/workouts_list_bloc.dart';
import 'package:workout_diary_bloc/models/session_exercise.dart';
import 'package:workout_diary_bloc/models/workout_model.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionExerciseBloc, SessionExerciseState>(
      builder: (context, state) {
        if (state is SessionExerciseInitial) {
          return Expanded(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 20.0, offset: Offset(5, 5), color: Colors.black87)
                ],
              ),
              child: SwipeButton.expand(
                height: 60,
                borderRadius: BorderRadius.circular(15.0),
                thumb: const Icon(Icons.arrow_forward_ios, color: MyColors.whiteColor,),
                activeThumbColor: MyColors.activeColor,
                activeTrackColor: MyColors.activeColor,
                onSwipe: () {
                  try {
                    List<SessionExercise> list = state.sessionExercises;
                    String time = context.read<StopwatchCubit>().state;
                    if (state.sessionExercises.isEmpty) {
                      throw SessionListException(context.locale!.noExercisesAdded);
                    }
                    for (var exercise in state.sessionExercises) {
                      if (exercise.title==null) {
                        throw SessionListException(context.locale!.youShouldSelectExercise);
                      }
                    }
                    context.read<WorkoutsListBloc>().add(
                      AddWorkout(
                        workout: Workout(
                          exercises: list,
                          duration: time,
                          dateTime: DateTime.parse(DateFormat("yyyy-MM-dd").format(DateTime.now())),
                        ),
                      ),
                    );
                    context.read<SessionExerciseBloc>().add(ResetState());
                    Navigator.pop(context);
                  } catch (e) {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext dialogContext) {
                        if (e is SessionListException) {
                          return AlertDialog(
                            backgroundColor: MyColors.lightGreyColor,
                            title: Text(e.toString()),
                            actions: <Widget>[
                              TextButton(
                                child: Text(context.locale!.gotTt, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyColors.activeColor),),
                                onPressed: () {
                                  Navigator.of(dialogContext)
                                      .pop(); // Dismiss alert dialog
                                },
                              ),
                            ],
                          );
                        }
                        return AlertDialog(
                          title: Text(context.locale!.somethingWentWrong),
                          content: Text(context.locale!.errorOccurred),
                          actions: <Widget>[
                            TextButton(
                              child: Text(context.locale!.close),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  textAlign: TextAlign.center,
                  context.locale!.slideToFinish, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyColors.whiteColor),),
              ),
            ),
          );
        } else {
          return const Placeholder();
        }
      },);
  }
}
