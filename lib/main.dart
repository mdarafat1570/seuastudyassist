import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seustudyassist/dashboard/home_page.dart';
import 'package:seustudyassist/login_page/page_swipe/onboarding_screen.dart';

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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
