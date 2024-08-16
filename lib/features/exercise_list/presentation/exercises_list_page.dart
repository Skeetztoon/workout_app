import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/core/widgets/small_back_button.dart';
import 'package:workout_diary_bloc/features/exercise_list/bloc/exercises_list_bloc.dart';
import 'package:workout_diary_bloc/features/exercise_list/presentation/widgets/operation_alert_window.dart';
import 'package:workout_diary_bloc/features/exercise_list/presentation/widgets/exercise_list_tile.dart';
import 'package:workout_diary_bloc/core/widgets/wide_button.dart';
import 'package:workout_diary_bloc/theme/colors.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

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
        padding: MyPadding.pagePadding,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'YOUR EXERCISES',
              style: Theme.of(context).textTheme.titleLarge,
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
            Row(
              children: [
                SmallBackButton(onTap: () {
                  Navigator.pop(context);
                }),
                const SizedBox(width: 20,),
                WideButton(color: MyColors.activeColor, text: 'Add exercise', textColor: MyColors.whiteColor,
                  onTap: () {
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
                  },)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

