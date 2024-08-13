import 'package:flutter/material.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: MyColors.backgroundColor,
  textTheme: myTextTheme,
);

TextTheme myTextTheme = const TextTheme(
  bodyLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: MyColors.whiteColor),
  bodyMedium: TextStyle(fontSize: 22,),
  bodySmall: TextStyle(fontSize: 18, ),
);