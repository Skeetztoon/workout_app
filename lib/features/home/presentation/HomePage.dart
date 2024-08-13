import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/features/home/presentation/widgets/animated_list_button.dart';
import 'package:workout_diary_bloc/features/home/presentation/widgets/place_holder_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            AnimatedListButton(),
            SizedBox(height: 50,),
            PlaceHolderContainer()
          ],
        ),
      ),
    );
  }
}

