import 'package:flutter/material.dart';
import 'package:seustudyassist/widgetFile/bottomnavigationbar.dart';

void main() {
  runApp(SeuStudyAssist());
}

class SeuStudyAssist extends StatelessWidget {
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
