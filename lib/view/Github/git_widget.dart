import 'package:fitness/hook/fetch_contribution.dart';
import 'package:flutter/material.dart';

class ContributionsCalendar extends StatelessWidget {
  final List<Contribution> contributions;
  final int weeksToShow;

  ContributionsCalendar({
    required this.contributions,
    this.weeksToShow = 52,  // Default to show a year's worth of data
  });

  @override
  Widget build(BuildContext context) {
    final int daysToShow = weeksToShow * 7;
    final DateTime endDate = DateTime.now();
    final DateTime startDate = endDate.subtract(Duration(days: daysToShow - 1));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double cellSize = 14.0;  // Fixed cell size
          double height = cellSize * 7 + 20;  // 7 days + 6 for margins
          double width = (cellSize + 2) * weeksToShow;  // +2 for margins
      
          return SizedBox(
            height: height,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,  // Start scroll from the right (most recent)
              child: SizedBox(
                width: width,
                height: height,
                child: Row(
                  children: List.generate(weeksToShow, (weekIndex) {
                    return Column(
                      children: List.generate(7, (dayIndex) {
                        DateTime currentDate = startDate.add(Duration(days: weekIndex * 7 + dayIndex));
                        if (currentDate.isAfter(endDate)) {
                          return SizedBox(width: cellSize, height: cellSize);
                        }
      
                        List<Contribution> contributionsForDay = contributions
                            .where((contribution) =>
                                contribution.date.year == currentDate.year &&
                                contribution.date.month == currentDate.month &&
                                contribution.date.day == currentDate.day)
                            .toList();
      
                        return Container(
                          width: cellSize,
                          height: cellSize,
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: getColorForCount(contributionsForDay.isNotEmpty ? contributionsForDay[0].count : 0),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showContributionsDialog(context, currentDate, contributionsForDay);
                            },
                            child: Tooltip(
                              message: '${currentDate.toShortDateString()}: ${contributionsForDay.isNotEmpty ? contributionsForDay[0].count : 0} contributions',
                              child: Container(),
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showContributionsDialog(BuildContext context, DateTime date, List<Contribution> contributions) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contributions on ${date.toShortDateString()}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (contributions.isEmpty)
                Text('No contributions found for this day.'),
              for (var contribution in contributions)
                ListTile(
                  title: Text('Count: ${contribution.count.toString()}'),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Color getColorForCount(int count) {
    if (count > 20)
      return Color.fromARGB(255, 0, 0, 0)!;
    else if (count > 10)
      return const Color.fromARGB(255, 33, 75, 35)!;
    else if (count > 0)
      return Colors.green[300]!;
    else
      return Colors.grey[300]!;
  }
}

extension DateHelpers on DateTime {
  String toShortDateString() {
    return "${this.year}-${this.month.toString().padLeft(2, '0')}-${this.day.toString().padLeft(2, '0')}";
  }
}