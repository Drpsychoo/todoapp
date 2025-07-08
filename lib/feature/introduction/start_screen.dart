import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texastodo/feature/login/login_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Welcome to UpTodo',
              style: TextStyle(color: Colors.white, fontSize: 32.sp),
            ),
            SizedBox(height: 30.h),
            Text(
              'Please login to your account or create',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            Text(
              'new account to continue',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff8875FF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const StartScreen()));
              },
              child: Container(
                margin: EdgeInsets.all(16.r),
                padding: EdgeInsets.all(12.r),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xff8875FF)),
                ),
                child: Center(
                  child: Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
