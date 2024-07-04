import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            color: Colors.yellow.shade700,
            child: Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                'assets/Animation1.json',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
