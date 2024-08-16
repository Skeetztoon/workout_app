import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:intl/intl.dart';
import 'package:workout_diary_bloc/core/exceptions/empty_title_exception.dart';
import 'package:workout_diary_bloc/core/widgets/small_back_button.dart';
import 'package:workout_diary_bloc/features/new_workout/bloc/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/stopwatch.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/workout_list_container.dart';
import 'package:workout_diary_bloc/features/new_workout/stopwatch_cubit/stopwatch_cubit.dart';
import 'package:workout_diary_bloc/features/workouts_list/bloc/workouts_list_bloc.dart';
import 'package:workout_diary_bloc/models/session_exercise.dart';
import 'package:workout_diary_bloc/models/workout_model.dart';
import 'package:workout_diary_bloc/theme/colors.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

class NewWorkoutPage extends StatefulWidget {
  const NewWorkoutPage({super.key});

  @override
  State<NewWorkoutPage> createState() => _NewWorkoutPageState();
}

class _NewWorkoutPageState extends State<NewWorkoutPage> {
  final stopWatch = Stopwatch();
  @override
  void initState() {
    stopWatch.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyPadding.pagePadding,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'NEW WORKOUT',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const MyStopwatch(),
            const SizedBox(
              height: 10,
            ),
            const WorkoutListContainer(),
            const SizedBox(
              height: 20,
            ),
            _actionButtons(),
          ],
        ),
      ),
    );
  }


  Widget _actionButtons() {
    return Row(
      children: [
        SmallBackButton(onTap: () {
          context.read<SessionExerciseBloc>().add(ResetState());
          Navigator.pop(context);
        },),
        const SizedBox(width: 20,),
        BlocBuilder<SessionExerciseBloc, SessionExerciseState>(
          builder: (context, state) {
            if (state is SessionExerciseInitial) {
              return Expanded(
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
                      for (var exercise in state.sessionExercises) {
                        if (exercise.title==null) {
                          throw const EmptyTitleException('You should select exercise');
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
                          if (e is EmptyTitleException) {
                            return AlertDialog(
                              backgroundColor: MyColors.lightGreyColor,
                              title: Text(e.toString()),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Got it', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyColors.activeColor),),
                                  onPressed: () {
                                    Navigator.of(dialogContext)
                                        .pop(); // Dismiss alert dialog
                                  },
                                ),
                              ],
                            );
                          }
                          return AlertDialog(
                            title: const Text('Something went wrong'),
                            content: const Text('Error occurred'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
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
                  child: Text('Slide to finish', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyColors.whiteColor),),
                ),
              );
            } else {
              return const Placeholder();
            }
          },),
      ],
    );
  }
}
