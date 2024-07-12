import 'dart:convert';

// Function to deserialize JSON string to a list of Expense objects
List<Expense> foodFromJson(String str) => List<Expense>.from(json.decode(str).map((x) => Expense.fromJson(x)));

// Function to serialize a list of Expense objects to JSON string
String foodToJson(List<Expense> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expense {
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final int v;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.v,
  });

  // Factory constructor to create a Expense object from JSON map
  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    id: json["_id"],
    title: json["title"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
    v: json["__v"],
  );

  // Method to convert a Expense object to JSON map
  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "amount": amount,
    "date": date.toIso8601String(),
    "__v": v,
  };
}
