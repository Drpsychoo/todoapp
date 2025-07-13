// ignore_for_file: deprecated_member_use

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime selectedDate = DateTime.now();
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> tasksToday = [
    {
      'title': 'Do Math Homework',
      'time': 'Today At 16:45',
      'tag': 'University',
      'tagColor': Colors.blue,
      'count': 1,
    },
    {
      'title': 'Tack out dogs',
      'time': 'Today At 18:20',
      'tag': 'Home',
      'tagColor': Colors.red,
      'count': 2,
    },
    {
      'title': 'Business meeting with CEO',
      'time': 'Today At 08:15',
      'tag': 'Work',
      'tagColor': Colors.orange,
      'count': 3,
    },
  ];

  final List<Map<String, dynamic>> completedTasks = [
    {'title': 'Buy Grocery', 'time': 'Today At 16:45'},
  ];

  Widget buildTaskItem(Map<String, dynamic> task) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 8, backgroundColor: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task['title'],
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  task['time'],
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          if (task['tag'] != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: task['tagColor'],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                task['tag'],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          if (task['count'] != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${task['count']}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = selectedTabIndex == 0 ? tasksToday : completedTasks;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // TODO: Add action here
          },
          icon: SvgPicture.asset(
            'assets/nav/mk.svg',
            color: Colors.white,
            width: 28.w,
            height: 28.h,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 17.r,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/images/photo.svg',
                  color: Colors.blue,
                  width: 28.w,
                  height: 28.h,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: EasyDateTimeLine(
              initialDate: selectedDate,
              onDateChange: (date) {
                setState(() => selectedDate = date);
              },
              activeColor: Colors.purple,
              headerProps: const EasyHeaderProps(
                selectedDateStyle: TextStyle(color: Colors.white),
                monthPickerType: MonthPickerType.switcher,
              ),
              dayProps: EasyDayProps(
                activeBorderRadius: 16,
                height: 80,
                width: 60,
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: Colors.blue.shade400,
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: const DayStyle(
                  dayNumStyle: TextStyle(color: Colors.white),
                  dayStrStyle: TextStyle(color: Colors.white70),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                inactiveDayStyle: const DayStyle(
                  dayNumStyle: TextStyle(color: Colors.white54),
                  dayStrStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => selectedTabIndex = 0),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedTabIndex == 0
                              ? Colors.purple
                              : Colors.grey[800],
                    ),
                    child: const Text("Today"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => selectedTabIndex = 1),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedTabIndex == 1
                              ? Colors.purple
                              : Colors.grey[800],
                    ),
                    child: const Text("Completed"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: tasks.map(buildTaskItem).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
