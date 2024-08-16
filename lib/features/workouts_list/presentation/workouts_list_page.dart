import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/workouts_list/bloc/workouts_list_bloc.dart';
import 'package:workout_diary_bloc/features/workouts_list/presentation/widgets/workout_list_tile.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

class WorkoutsListPage extends StatefulWidget {
  const WorkoutsListPage({super.key});

  @override
  State<WorkoutsListPage> createState() => _WorkoutsListPageState();
}

class _WorkoutsListPageState extends State<WorkoutsListPage> {

  //TODO add scrolling to top

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
              'YOUR SESSIONS',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<WorkoutsListBloc, WorkoutsListState>(
              builder: (context, state) {
                if (state is WorkoutsListInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WorkoutsListLoaded) {
                  return Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.workouts.length,
                        itemBuilder: (context, index) {
                          return WorkoutListTile(
                            workout: state.workouts[index],
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
    );
  }
}
