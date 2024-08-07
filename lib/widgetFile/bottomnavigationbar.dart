import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seustudyassist/aipage2/Chatbot.dart';
import 'package:seustudyassist/aipage2/home_page.dart';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/dashboard/home_page.dart';
import 'package:seustudyassist/settingpage/settingsMainPage/settings_main_page.dart';
import 'package:seustudyassist/tuitionCalculator/Calculator_Screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int countindex = 0;
  List<Widget> widgetList = [
    HomePage(),
    const CoursePage(),
    const CalculatorScreen(),
    AiHomePage(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[countindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: (index) {
          setState(() {
            countindex = index;
          });
        },
        currentIndex: countindex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home, color: Colors.grey, size: 18),
            activeIcon: FaIcon(FontAwesomeIcons.home, color: Colors.black, size: 18),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpenReader, color: Colors.grey, size: 18),
            activeIcon: FaIcon(FontAwesomeIcons.bookOpenReader, color: Colors.black, size: 18),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calculator, color: Colors.grey, size: 18),
            activeIcon: FaIcon(FontAwesomeIcons.calculator, color: Colors.black, size: 18),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.robot, color: Colors.grey, size: 18),
            activeIcon: FaIcon(FontAwesomeIcons.robot, color: Colors.black, size: 18),
            label: 'Ai',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.gear, color: Colors.grey, size: 18),
            activeIcon: FaIcon(FontAwesomeIcons.gear, color: Colors.black, size: 18),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
