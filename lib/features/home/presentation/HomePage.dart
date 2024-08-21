import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/features/home/presentation/widgets/animated_list_button.dart';
import 'package:workout_diary_bloc/features/home/presentation/widgets/calendar.dart';
import 'package:workout_diary_bloc/features/home/presentation/widgets/last_session_container.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Padding(
        padding: MyPadding.pagePadding,
        child: Column(
          children: [
            AnimatedListButton(),
            SizedBox(height: 50,),
            LastSessionContainer(),
            SizedBox(height: 20,),
            Calendar(),
          ],
        ),
      ),
    );
  }
}

