import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/new_workout/bloc/session_exercise_bloc.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class SmallBackButton extends StatefulWidget {
  const SmallBackButton({super.key});

  @override
  State<SmallBackButton> createState() => _SmallBackButtonState();
}

class _SmallBackButtonState extends State<SmallBackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: MyColors.lightGreyColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(blurRadius: 20.0, offset: Offset(5, 5), color: Colors.black87)
        ],
      ),
      child: const Icon(Icons.arrow_back_ios_new, color: MyColors.darkGreyColor,),
    );
  }
}
