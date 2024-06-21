import 'package:flutter/material.dart';
import 'package:seustudyassist/widgetFile/bottomnavigationbar.dart';

void main() {
  runApp(SeuStudyAssist());
}

class SeuStudyAssist extends StatefulWidget {
  @override
  State<SeuStudyAssist> createState() => _SeuStudyAssistState();
}

class _SeuStudyAssistState extends State<SeuStudyAssist> {
  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
