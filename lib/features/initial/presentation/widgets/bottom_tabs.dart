import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/features/initial/bottom_tabs/bottom_tabs_bloc.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // height: 70,
      shape: const CircularNotchedRectangle(),
      color: MyColors.blackColor,
      child: BlocBuilder<BottomTabsBloc, BottomTabsState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.read<BottomTabsBloc>().add(ChangeTab(index: 0));
                },
                icon: Icon(
                  Icons.home_filled,
                  color: (state.tabIndex == 0)
                      ? MyColors.activeColor
                      : MyColors.darkGreyColor,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<BottomTabsBloc>().add(ChangeTab(index: 1));
                },
                icon: Icon(
                  Icons.subject,
                  color: (state.tabIndex == 1)
                      ? MyColors.activeColor
                      : MyColors.darkGreyColor,
                  size: 40,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
