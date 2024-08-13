import 'package:equatable/equatable.dart';

class Exercise extends Equatable{
  final String id;
  final String title;
  const Exercise({required this.id, required this.title,});

  @override
  List<Object?> get props => [id, title,];

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "title": title,
    };
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(id: json['id'], title: json['title'],);
  }
}