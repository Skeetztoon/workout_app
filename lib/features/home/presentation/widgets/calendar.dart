import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:workout_diary_bloc/features/workouts_list/bloc/workouts_list_bloc.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: MyColors.lightGreyColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(blurRadius: 20.0, offset: Offset(5, 5), color: Colors.black87)
        ],
      ),
      child: BlocBuilder<WorkoutsListBloc, WorkoutsListState>(
        builder: (context, state) {
          if (state is WorkoutsListLoaded) {
            final Map<DateTime, int> map = {};
            for (var e in state.workouts) {
              map[e.dateTime]=1;
            }
            return HeatMapCalendar(
              flexible: true,
              monthFontSize: 22,
              textColor: MyColors.blackColor,
              borderRadius: 30,
              showColorTip: false,
              colorsets: const {
                1: MyColors.activeColor,
              },
              datasets: map,
            );
          } else {return const Center(child: CircularProgressIndicator());}
        },
      ),
    );
  }
}
