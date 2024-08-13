import 'package:equatable/equatable.dart';

class SessionExercise extends Equatable {
  String? title;
   int? reps;
   int? sets;
   int? load;

   SessionExercise({this.title, this.reps, this.sets, this.load});

  @override
  List<Object?> get props => [title, reps, sets, load];

  factory SessionExercise.fromJson(Map<String, dynamic> json) {
    return SessionExercise(title: json['title'], reps: int.parse(json['reps']), sets: int.parse(json['sets']), load: int.parse(json['load']),);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'reps' : reps.toString(),
      'sets' : sets.toString(),
      'load' : load.toString(),
    };
  }
}