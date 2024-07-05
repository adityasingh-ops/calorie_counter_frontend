import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  final String id;
  final int amount;
  final DateTime time;
  final int version;

  Transaction({
    required this.id,
    required this.amount,
    required this.time,
    required this.version,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["_id"],
      amount: json["amount"],
      time: DateTime.parse(json["time"] ?? json["timestamp"]),
      version: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "amount": amount,
    "time": time.toIso8601String(),
    "__v": version,
  };
}
