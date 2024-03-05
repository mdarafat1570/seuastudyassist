import 'package:flutter/material.dart';
import 'package:seustudyassist/dashboard/dashboard.dart';
import 'package:seustudyassist/dashboard/home_page.dart';

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
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
