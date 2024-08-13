import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/features/new_workout/presentation/new_workout_page.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'FAB',
      child: SizedBox(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: null,
              shape: const CircleBorder(),
              backgroundColor: MyColors.activeColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NewWorkoutPage()));
              },
              child: const Icon(
                Icons.add,
                color: MyColors.whiteColor,
              )),
        ),
      ),
    );
  }
}
