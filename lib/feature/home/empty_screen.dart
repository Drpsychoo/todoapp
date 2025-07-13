// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyHomePage extends StatefulWidget {
  const EmptyHomePage({super.key});

  @override
  State<EmptyHomePage> createState() => _EmptyHomePageState();
}

class _EmptyHomePageState extends State<EmptyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index'),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/empty.svg'),
            Text('What do you want to do today?'),
            Text('Tap + to add your tasks'),
          ],
        ),
      ),
    );
  }
}
