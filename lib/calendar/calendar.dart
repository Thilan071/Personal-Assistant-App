import 'package:flutter/material.dart';
import '../navigationIcons/navigationIcons.dart'; // Import the navigation bar

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _selectedIndex = 1; // Calendar is the active tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Calendar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(children: [_buildCalendar(), _buildSchedule()]),
      bottomNavigationBar: NavigationIcons(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ), // Use NavigationIcons
    );
  }

  Widget _buildCalendar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {},
                color: Colors.grey,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const Text(
                'March 2025',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {},
                color: Colors.grey,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildWeekDayLabels(),
          const SizedBox(height: 8),
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildWeekDayLabels() {
    final weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          weekDays
              .map(
                (day) => SizedBox(
                  width: 30,
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildCalendarDays() {
    final daysData = [
      [23, 24, 25, 26, 27, 28, 1],
      [2, 3, 4, 5, 6, 7, 8],
      [9, 10, 11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20, 21, 22],
      [23, 24, 25, 26, 27, 28, 29],
      [30, 31, null, null, null, null, null],
    ];

    return Column(
      children:
          daysData.map((week) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    week.map((day) {
                      final isToday = day == 15;
                      final isPreviousMonth =
                          day != null && week == daysData.first && day > 22;

                      if (day == null) {
                        return const SizedBox(width: 30);
                      }

                      return Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isToday ? Colors.blue : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            day.toString(),
                            style: TextStyle(
                              color:
                                  isToday
                                      ? Colors.white
                                      : isPreviousMonth
                                      ? Colors.grey[400]
                                      : Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildSchedule() {
    final scheduleItems = [
      {'title': 'Team Standup', 'time': '9:00 AM', 'duration': '30 min'},
      {
        'title': 'Client Presentation',
        'time': '11:30 AM',
        'duration': '1 hour',
      },
      {'title': 'Project Planning', 'time': '2:00 PM', 'duration': '45 min'},
      {'title': 'Dentist Appointment', 'time': '4:30 PM', 'duration': '1 hour'},
    ];

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Schedule",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: scheduleItems.length,
                itemBuilder: (context, index) {
                  final item = scheduleItems[index];
                  return _buildScheduleItem(
                    item['title']!,
                    item['time']!,
                    item['duration']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(String title, String time, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                duration,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
