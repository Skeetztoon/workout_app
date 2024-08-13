import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/session_exercise_list_tile.dart';
import 'package:workout_diary_bloc/features/new_workout/session_exercise/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/models/session_exercise.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class NewWorkoutPage extends StatefulWidget {
  const NewWorkoutPage({super.key});

  @override
  State<NewWorkoutPage> createState() => _NewWorkoutPageState();
}

class _NewWorkoutPageState extends State<NewWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'YOUR EXERCISES',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'some time',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  color: MyColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<SessionExerciseBloc, SessionExerciseState>(
                      builder: (context, state) {
                        if (state is SessionExerciseInitial) {
                          return ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 500),
                            child: ListView.builder(
                                itemCount: state.sessionExercises.length,
                                itemBuilder: (context, index) {
                                  return SessionExerciseListTile(
                                    index: index,
                                  );
                                }),
                          );
                        } else {
                          return const Text('Something went wrong');
                        }
                      },
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        context.read<SessionExerciseBloc>().add(AddSessionExercise(exercise: SessionExercise()));
                      },
                      label: const Text('ADD'),
                      backgroundColor: MyColors.activeColor,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: SwipeButton.expand(
                height: 80,
                thumb: const Icon(Icons.arrow_forward_ios),
                activeThumbColor: MyColors.activeColor,
                activeTrackColor: MyColors.activeColor,
                onSwipe: () {},
                child: const Text('Slide to finish'),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
