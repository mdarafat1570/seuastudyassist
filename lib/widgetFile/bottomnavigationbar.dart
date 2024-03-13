import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seustudyassist/settingpage/Settingpage.dart';
import 'package:seustudyassist/calculatorPage/calculator.dart';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/dashboard/home_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int countindex = 0;
  List<Widget> widgetList = [
    HomePage(),
    CoursePage(),
    calculatorPage(),
    settingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[countindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (index) {
          setState(() {
            countindex = index;
          });
        },
        currentIndex: countindex,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home, color: Colors.grey, size: 18),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpenReader,
                color: Colors.grey, size: 18),
            label: 'course',
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calculator,
                  color: Colors.grey, size: 18),
              label: 'Calculator'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gear, color: Colors.grey, size: 18),
              label: 'Settings'),
        ],
      ),
    );
  }
}
