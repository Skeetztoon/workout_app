import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_diary_bloc/features/exercise_list/bloc/exercises_list_bloc.dart';
import 'package:workout_diary_bloc/features/initial/bottom_tabs/bottom_tabs_bloc.dart';
import 'package:workout_diary_bloc/features/initial/presentation/initial_page.dart';
import 'package:workout_diary_bloc/features/new_workout/bloc/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/stopwatch_cubit/stopwatch_cubit.dart';
import 'package:workout_diary_bloc/features/workouts_list/bloc/workouts_list_bloc.dart';
import 'package:workout_diary_bloc/theme/dark_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        BlocProvider(create: (_) => StopwatchCubit()),
      ],
      child: Builder(
        builder: (context) {
          final String deviceLocale = Platform.localeName;
          return MaterialApp(
            supportedLocales: const [Locale('en'), Locale('ru')],
            locale: (deviceLocale.startsWith('ru')) ? const Locale('ru') : const Locale('en'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'Workout Tracker App',
            theme: darkTheme,
            home: const InitialPage(),
          );
        }
      ),
    );
  }
}
