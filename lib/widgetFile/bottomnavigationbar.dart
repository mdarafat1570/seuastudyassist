import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seustudyassist/Pages/Ai.dart';
import 'package:seustudyassist/Pages/Settingpage.dart';
import 'package:seustudyassist/Pages/calculator.dart';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/dashboard/home_page.dart';

// class AppBottomNavigationBar {
//   static NavigationBar appBottomNavigation(
//       void Function(int index) onIndexChanged, int selectedIndex) {
//     return NavigationBar(
//       height: 70,
//       elevation: 0,
//       selectedIndex: selectedIndex,
//       onDestinationSelected: onIndexChanged,
//       backgroundColor: Colors.white,
//       destinations: const [
//         NavigationDestination(
//             icon: FaIcon(FontAwesomeIcons.home, color: Colors.grey, size: 18),
//             label: 'Home'),
//         NavigationDestination(
//             icon: FaIcon(FontAwesomeIcons.bookOpenReader,
//                 color: Colors.grey, size: 18),
//             label: 'course'),
//         NavigationDestination(
//             icon: FaIcon(FontAwesomeIcons.calculator,
//                 color: Colors.grey, size: 18),
//             label: 'Calculator'),
//         NavigationDestination(
//             icon: FaIcon(FontAwesomeIcons.gear, color: Colors.grey, size: 18),
//             label: 'Settings'),
//       ],
//     );
//   }
// }
class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int countindex = 0;
  List<Widget> widgetList = [
    HomePage("Azizul Hakim", name: 'Azizu hakim'),
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
