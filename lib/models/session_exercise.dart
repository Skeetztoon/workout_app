import 'package:equatable/equatable.dart';
//ignore: must_be_immutable
class SessionExercise extends Equatable {
  String? title;
   int reps;
   int sets;
   int load;

   SessionExercise({this.title, this.reps=1, this.sets=1, this.load=0});

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