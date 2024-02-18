import 'package:flutter/material.dart';

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
            icon: Icon(Icons.home_outlined, color: Colors.grey), label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.person_outline, color: Colors.grey),
            label: 'course'),
        NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline_outlined, color: Colors.grey),
            label: 'Chat'),
        NavigationDestination(
            icon: Icon(Icons.settings, color: Colors.grey), label: 'Settings'),
      ],
    );
  }
}
