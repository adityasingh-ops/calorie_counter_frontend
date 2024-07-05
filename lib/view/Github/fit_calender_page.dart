import 'package:fitness/hook/fetch_contribution.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'git_widget.dart';

class GitHubCalendarPage extends StatefulWidget {
  final String username;

  GitHubCalendarPage({required this.username});

  @override
  _GitHubCalendarPageState createState() => _GitHubCalendarPageState();
}

class _GitHubCalendarPageState extends State<GitHubCalendarPage> {
  late Future<List<Contribution>> futureContributions;
  late DateTime _focusedDay;
  late CalendarFormat _calendarFormat;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    futureContributions = fetchContributions(widget.username);
    _focusedDay = DateTime.now();
    _calendarFormat = CalendarFormat.month;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Contributions'),
      ),
      body: FutureBuilder<List<Contribution>>(
        future: futureContributions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No contributions found'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                ContributionsCalendar(contributions: snapshot.data!),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final contribution = snapshot.data![index];
                      return ListTile(
                        title: Text('Date: ${contribution.date.toString()}'),
                        subtitle: Text('Count: ${contribution.count.toString()}'),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
