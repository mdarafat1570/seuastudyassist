import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Text(
          "This is the second page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
