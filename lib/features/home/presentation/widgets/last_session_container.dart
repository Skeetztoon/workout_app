import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_diary_bloc/core/extentions/build_context_extention.dart';
import 'package:workout_diary_bloc/core/widgets/shimmer_placeholder.dart';
import 'package:workout_diary_bloc/features/workouts_list/bloc/workouts_list_bloc.dart';
import 'package:workout_diary_bloc/features/workouts_list/presentation/workout_session_page.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class LastSessionContainer extends StatelessWidget {
  const LastSessionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: const BoxDecoration(
        color: MyColors.lightGreyColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
              blurRadius: 20.0, offset: Offset(5, 5), color: Colors.black87)
        ],
      ),
      child: BlocBuilder<WorkoutsListBloc, WorkoutsListState>(
        builder: (context, state) {
          if (state is WorkoutsListLoaded) {
             if (state.workouts.isEmpty){
               return  Center(child: Text(context.locale!.youHadNoWorkoutsYet, style: Theme.of(context).textTheme.bodyMedium,),);
             } else {
               int daysAgo = DateTime.now().difference(state.workouts.last.dateTime).inDays;
               return Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         context.locale!.lastSession,
                         style: Theme.of(context)
                             .textTheme
                             .bodyMedium
                             ?.copyWith(fontWeight: FontWeight.bold),
                       ),
                       (daysAgo > 0)
                           ? Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text(daysAgo.toString(),
                               style: Theme.of(context)
                                   .textTheme
                                   .titleLarge
                                   ?.copyWith(
                                   color: MyColors.activeColor,
                                   fontWeight: FontWeight.bold)),
                           Text(" ${context.locale!.daysAgo(daysAgo)}",
                               style: Theme.of(context)
                                   .textTheme
                                   .bodyMedium
                                   ?.copyWith(fontWeight: FontWeight.bold)),
                         ],
                       )
                           : Text(context.locale!.today,
                           style: Theme.of(context).textTheme.titleLarge?.copyWith(
                               color: MyColors.activeColor,
                               fontWeight: FontWeight.bold)),
                     ],
                   ),
                   InkWell(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutSessionPage(workout: state.workouts.last)));
                     },
                     child: Container(
                       height: 80,
                       width: 80,
                       decoration: BoxDecoration(
                         color: MyColors.activeColor,
                         borderRadius: BorderRadius.circular(40),
                       ),
                       child: const Icon(
                         Icons.arrow_forward_ios,
                         color: MyColors.lightGreyColor,
                       ),
                     ),
                   )
                 ],
               );
             }


          } else {
            return const ShimmerPlaceholder(width: 160, height: 40, color: MyColors.darkGreyColor);
          }
        },
      ),
    );
  }
}
