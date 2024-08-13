import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/home/presentation/HomePage.dart';
import 'package:workout_diary_bloc/features/initial/bottom_tabs/bottom_tabs_bloc.dart';
import 'package:workout_diary_bloc/features/initial/presentation/widgets/bottom_tabs.dart';
import 'package:workout_diary_bloc/features/initial/presentation/widgets/floating_button.dart';
import 'package:workout_diary_bloc/features/workouts_list/presentation/workouts_list_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<BottomTabsBloc, BottomTabsState>(
        builder: (context, state) {
          return (state.tabIndex == 0)
              ? const HomePage()
              : const WorkoutsListPage();
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: const FloatingButton(),

      bottomNavigationBar: const BottomTabs(),
    );
  }
}
