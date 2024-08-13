import 'package:workout_diary_bloc/models/session_exercise.dart';

class Workout {
  final List<SessionExercise> exercises;
  final DateTime dateTime;
  final String duration;

  Workout({required this.exercises, required this.dateTime, required this.duration});

  factory Workout.fromJson(Map<String, dynamic> json) {

    var list = (json['exercises'] as List).map((exercise) => SessionExercise.fromJson(exercise)).toList();
    DateTime dateTime = DateTime.parse(json['dateTime']);

    return Workout(
        exercises: list,
        dateTime: dateTime,
        duration: json['duration'],);
  }

  Map<String, dynamic> toJson() {
    return {
      'exercises' : exercises.map((e) => e.toJson()).toList(),
      'dateTime' : dateTime.toIso8601String(),
      'duration' : duration,
    };
  }
}