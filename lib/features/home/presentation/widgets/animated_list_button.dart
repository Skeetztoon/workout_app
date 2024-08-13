import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/features/exercise_list/presentation/exercises_list_page.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class AnimatedListButton extends StatefulWidget {
  const AnimatedListButton({super.key});

  @override
  State<AnimatedListButton> createState() => _AnimatedListButtonState();
}

class _AnimatedListButtonState extends State<AnimatedListButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExerciseListPage()));
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: MyColors.activeColor,
            child: Icon(Icons.list, size: 30,),
          ),
        ),
      ],
    );
  }
}
