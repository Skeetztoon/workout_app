import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/core/extentions/build_context_extention.dart';
import 'package:workout_diary_bloc/core/widgets/bounce_button.dart';
import 'package:workout_diary_bloc/core/widgets/small_back_button.dart';
import 'package:workout_diary_bloc/features/new_workout/bloc/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/slider.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/stopwatch.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/workout_list_container.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

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
        padding: MyPadding.pagePadding,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              context.locale!.newWorkout,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
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
        BounceButton(
          onTap: () {
            context.read<SessionExerciseBloc>().add(ResetState());
            Navigator.pop(context);
          },
          child: const SmallBackButton(),
        ),
        const SizedBox(width: 20,),
        const MySlider(),
      ],
    );
  }
}
