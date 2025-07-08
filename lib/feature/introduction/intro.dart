import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:texastodo/feature/introduction/start_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardingDone', true);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const StartScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.black,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      pages: [
        //first
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo/image.png'),
                SizedBox(height: 20),
                Text(
                  "UpTodo",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),
        //second
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo/second.png'),
                SizedBox(height: 50),
                Image.asset('assets/logo/nav.png'),
                SizedBox(height: 50),
                Text(
                  "Manage your tasks",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "You can easily manage all of your daily ",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "tasks in DoMe for free",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),
        //thrid
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo/thrid.png'),
                SizedBox(height: 50),
                Image.asset('assets/logo/nav.png'),
                SizedBox(height: 50),
                Text(
                  "Create daily routine",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "In Uptodo  you can create your",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "personalized routine to stay productive",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),
        //fourth
        PageViewModel(
          titleWidget: Text(''),
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo/four.png'),
                SizedBox(height: 50),
                Image.asset('assets/logo/nav.png'),
                SizedBox(height: 50),
                Text(
                  "Orgonaize your tasks",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "You can organize your daily tasks",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "by adding your tasks into separate categories",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Text(''),
          decoration: PageDecoration(pageColor: Colors.black, fullScreen: true),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
