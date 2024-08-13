import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_diary_bloc/features/exercise_list/bloc/exercises_list_bloc.dart';
import 'package:workout_diary_bloc/features/initial/bottom_tabs/bottom_tabs_bloc.dart';
import 'package:workout_diary_bloc/features/initial/presentation/initial_page.dart';
import 'package:workout_diary_bloc/features/new_workout/session_exercise/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/features/workouts_list/bloc/workouts_list_bloc.dart';
import 'package:workout_diary_bloc/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ExercisesListBloc()
            ..add(LoadExerciseList()),
        ),
        BlocProvider(
          create: (context) =>
          WorkoutsListBloc()
            ..add(LoadWorkouts()),
        ),
        BlocProvider(create: (context) => BottomTabsBloc()),
        BlocProvider(create: (context) => SessionExerciseBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: darkTheme,
        home: const InitialPage(),
      ),
    );
  }
}
