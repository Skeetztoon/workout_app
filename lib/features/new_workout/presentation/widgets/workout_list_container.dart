import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/bloc/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/widgets/session_exercise_list_tile.dart';
import 'package:workout_diary_bloc/models/session_exercise.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class WorkoutListContainer extends StatefulWidget {
  const WorkoutListContainer({super.key});

  @override
  State<WorkoutListContainer> createState() => _WorkoutListContainerState();
}

class _WorkoutListContainerState extends State<WorkoutListContainer> {
  final ScrollController _scrollController = ScrollController();

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.lightGreyColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exercise',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: MyColors.darkGreyColor),
                ),
                Text(
                  'Reps Sets   KG ',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: MyColors.darkGreyColor),
                )
              ],
            ),
            BlocBuilder<SessionExerciseBloc, SessionExerciseState>(
              builder: (context, state) {
                if (state is SessionExerciseInitial) {
                  return Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
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
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: MyColors.activeColor,
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextButton(
                onPressed: () {
                context
                    .read<SessionExerciseBloc>()
                    .add(AddSessionExercise(exercise: SessionExercise()));
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => scrollToBottom());
              }, child: Row(children: [const Icon(Icons.add, color: MyColors.blackColor,), Text('ADD', style: Theme.of(context).textTheme.bodyMedium),],),),
            )
          ],
        ),
      ),
    );
  }
}
