import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/exercise_list/bloc/exercises_list_bloc.dart';
import 'package:workout_diary_bloc/features/exercise_list/presentation/widgets/operation_alert_window.dart';
import 'package:workout_diary_bloc/features/exercise_list/presentation/widgets/exercise_list_tile.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
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
            BlocBuilder<ExercisesListBloc, ExercisesListState>(
              builder: (context, state) {
                if (state is ExercisesListInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ExercisesListLoaded) {
                  return Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.exercises.length,
                        itemBuilder: (context, index) {
                          return ExerciseListTile(
                            exercise: state.exercises[index],
                          );
                        }),
                  );
                } else {
                  return const Center(
                    child: Text('Unable to load list :('),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Hero(
        tag: 'FAB',
        child: SizedBox(
          width: 80.0,
          height: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: MyColors.activeColor,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: MyColors.whiteColor,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return BlocBuilder<ExercisesListBloc, ExercisesListState>(
                          builder: (context, state) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          contentPadding: EdgeInsets.zero,
                          content: OperationAlertWindow(
                            operationType: OperationType.add,
                            buttonText: 'Add',
                          ),
                        );
                      });
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
