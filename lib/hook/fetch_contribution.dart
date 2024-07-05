import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Contribution>> fetchContributions(String username) async {
  final response = await http.get(Uri.parse('https://github-contributions-api.jogruber.de/v4/$username'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return (data['contributions'] as List).map((item) => Contribution.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load contributions');
  }
}
  Future<Map<String, int>> fetchTotalContributions(String username) async {
    final response = await http.get(Uri.parse('https://github-contributions-api.jogruber.de/v4/$username'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final total = Map<String, int>.from(data['total']);
      return total;
    } else {
      throw Exception('Failed to load contributions');
    }
  }



class Contribution {
  final DateTime date;
  final int count;

  Contribution({required this.date, required this.count});

  factory Contribution.fromJson(Map<String, dynamic> json) {
    return Contribution(
      date: DateTime.parse(json['date']),
      count: json['count'],
    );
  }
}
