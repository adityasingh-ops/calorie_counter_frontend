import 'dart:convert';

WaterData requestwaterDataFromJson(String str) => WaterData.fromJson(json.decode(str));

String requestwaterDataToJson(WaterData data) => json.encode(data.toJson());

class WaterData {
  final int amount;


  WaterData({
    required this.amount,
  });

  factory WaterData.fromJson(Map<String, dynamic> json) => WaterData(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}
