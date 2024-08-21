import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/core/extentions/build_context_extention.dart';
import 'package:workout_diary_bloc/core/widgets/bounce_button.dart';
import 'package:workout_diary_bloc/features/exercise_list/presentation/exercises_list_page.dart';
import 'package:workout_diary_bloc/features/home/presentation/widgets/about_page.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class AnimatedListButton extends StatefulWidget {
  const AnimatedListButton({super.key});

  @override
  State<AnimatedListButton> createState() => _AnimatedListButtonState();
}

class _AnimatedListButtonState extends State<AnimatedListButton>
    with SingleTickerProviderStateMixin {
  bool isExpanded = true;
  bool isVisible = true;

  void _expand() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      if (isExpanded == true) {
        setState(() {
          isVisible = !isVisible;
        });
        setState(() {
          isExpanded = !isExpanded;
        });
      }
    }

  }

  @override
  void initState() {
    _expand();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BounceButton(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
          },
          child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: MyColors.activeColor,
            boxShadow: const [ BoxShadow(
                blurRadius: 10.0, offset: Offset(5, 5), color: Colors.black87),],
          ),
          child: const Icon(Icons.settings, ),
        ),),
        BounceButton(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExerciseListPage()));
          },
          child: AnimatedContainer(
            curve: Curves.ease,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: MyColors.activeColor,
              boxShadow: const [ BoxShadow(
                  blurRadius: 10.0, offset: Offset(5, 5), color: Colors.black87),],
            ),
            duration: const Duration(milliseconds: 1000),
            width: isExpanded ? 180 : 50,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCrossFade(
                  firstChild: Text(context.locale!.exerciseList),
                  secondChild: Container(width: 0,),
                  crossFadeState: isVisible
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400),
                ),
                // AnimatedContainer(
                //   duration: const Duration(milliseconds: 400),
                //   child: (isVisible)?const Text('Exercises list'):null,
                // ),
                const Icon(Icons.reorder),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
