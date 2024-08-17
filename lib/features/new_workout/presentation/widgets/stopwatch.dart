import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/stopwatch_cubit/stopwatch_cubit.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class MyStopwatch extends StatefulWidget {
  const MyStopwatch({super.key});

  @override
  State<MyStopwatch> createState() => _MyStopwatchState();
}

class _MyStopwatchState extends State<MyStopwatch> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
    _initializeTimer();
  }

  void _initializeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      String time =
          '${_stopwatch.elapsed.inHours.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';

      context.read<StopwatchCubit>().changeValue(time);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchCubit, String>(
      builder: (context, time) => Text(
        time,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: MyColors.whiteColor),
      ),
    );
  }
}
