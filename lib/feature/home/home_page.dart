// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for your task...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),
            // Today filter button
            Row(
              children: [
                FilterChip(
                  label: const Text('Today'),
                  selected: true,
                  onSelected: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Task list
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TaskCard(
                    title: 'Do Math Homework',
                    time: 'Today At 16:45',
                    category: 'University',
                    categoryColor: Colors.blue,
                    icon: Icons.school,
                    comments: 1,
                  ),
                  const TaskCard(
                    title: 'Take out dogs',
                    time: 'Today At 18:20',
                    category: 'Home',
                    categoryColor: Colors.red,
                    icon: Icons.home,
                    comments: 2,
                  ),
                  const TaskCard(
                    title: 'Business meeting with CEO',
                    time: 'Today At 08:15',
                    category: 'Work',
                    categoryColor: Colors.amber,
                    icon: Icons.work,
                    comments: 3,
                  ),
                  const SizedBox(height: 20),
                  // Completed filter
                  FilterChip(
                    label: const Text('Completed'),
                    selected: false,
                    onSelected: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const TaskCard(
                    title: 'Buy Grocery',
                    time: 'Today At 16:45',
                    category: '',
                    categoryColor: Colors.transparent,
                    icon: Icons.check,
                    comments: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String time;
  final String category;
  final Color categoryColor;
  final IconData icon;
  final int comments;

  const TaskCard({
    super.key,
    required this.title,
    required this.time,
    required this.category,
    required this.categoryColor,
    required this.icon,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(
          Icons.radio_button_unchecked,
          color: Colors.white54,
        ),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        subtitle: Text(time, style: const TextStyle(color: Colors.white54)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (category.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: categoryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(icon, size: 16, color: categoryColor),
                    const SizedBox(width: 4),
                    Text(
                      category,
                      style: TextStyle(fontSize: 12, color: categoryColor),
                    ),
                  ],
                ),
              ),
            const SizedBox(width: 8),
            if (comments > 0)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('$comments', style: const TextStyle(fontSize: 12)),
              ),
          ],
        ),
      ),
    );
  }
}
