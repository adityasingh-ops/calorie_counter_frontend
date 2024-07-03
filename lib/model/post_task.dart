import 'dart:convert';

RequestData requestDataFromJson(String str) => RequestData.fromJson(json.decode(str));

String requestDataToJson(RequestData data) => json.encode(data.toJson());

class RequestData {
  final String title;
  final String subtitle;

  RequestData({
    required this.title,
    required this.subtitle,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
      };
}
