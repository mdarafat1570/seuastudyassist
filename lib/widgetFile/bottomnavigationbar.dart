import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNavigationBar {
  static NavigationBar appBottomNavigation(
      void Function(int index) onIndexChanged, int selectedIndex) {
    return NavigationBar(
      height: 80,
      elevation: 0,
      selectedIndex: selectedIndex,
      onDestinationSelected: onIndexChanged,
      backgroundColor: Colors.white,
      destinations: const [
        NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.home, color: Colors.grey, size: 18),
            label: 'Home'),
        NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.bookOpenReader,
                color: Colors.grey, size: 18),
            label: 'course'),
        NavigationDestination(
            icon:
                FaIcon(FontAwesomeIcons.barChart, color: Colors.grey, size: 18),
            label: 'Chat'),
        NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.cog, color: Colors.grey, size: 18),
            label: 'Settings'),
      ],
    );
  }
}
