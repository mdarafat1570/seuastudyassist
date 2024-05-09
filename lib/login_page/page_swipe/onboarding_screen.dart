import 'package:flutter/material.dart';
import 'package:seustudyassist/login_page/page_swipe/intro_screens/starting_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_screens/starting_page_1.dart';
import 'intro_screens/starting_page_2.dart';

class OnBoardingScren extends StatefulWidget {
  const OnBoardingScren({super.key});

  @override
  State<OnBoardingScren> createState() => _OnBoardingScrenState();
}

class _OnBoardingScrenState extends State<OnBoardingScren> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [IntroPage1(), IntroPage2(), IntroPage3()],
          ),
          //dot indicator
          Container(
              alignment: Alignment(0, 0.75),
              child: SmoothPageIndicator(controller: _controller, count: 3))
        ],
      ),
    );
  }
}
