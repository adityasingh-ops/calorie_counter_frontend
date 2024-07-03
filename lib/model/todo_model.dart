import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  final String id;
  final String title;
  final String subtitle;
   bool completed;
  final int v;

  Task({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.completed,
    required this.v,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["_id"],
    title: json["title"],
    subtitle: json["subtitle"],
    completed: json["completed"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "subtitle": subtitle,
    "completed": completed,
    "__v": v,
  };
}
