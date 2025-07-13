import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:texastodo/feature/calender/calender_page.dart';
import 'package:texastodo/feature/focus/focus_page.dart';
import 'package:texastodo/feature/home/empty_screen.dart';
import 'package:texastodo/feature/home/widget/addtaskbottom.dart';
import 'package:texastodo/feature/profile/profile_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [
      const EmptyHomePage(),
      const CalenderPage(),
      const SizedBox(),
      const FocusPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/nav/home.svg'),
        title: ("Home"),
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/nav/calender.svg'),
        title: ("Calendar"),
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      // This is your + ADD button in the center
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add, color: Colors.white, size: 32),
        title: "",
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        onPressed: (context) {
          showModalBottomSheet(
            context: context!,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => const AddTaskBottomSheet(),
          );
        },
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/nav/clock.svg'),
        title: ("Focus"),
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/nav/profile.svg'),
        title: ("Profile"),
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: 70,
      backgroundColor: const Color(0xff363636),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      isVisible: true,
      confineToSafeArea: true,
      decoration: NavBarDecoration(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.only(top: 8),
      navBarStyle: NavBarStyle.style15,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
    );
  }
}
