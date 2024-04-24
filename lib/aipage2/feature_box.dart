import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seustudyassist/aipage2/pallet.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String desecriptionText;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.headerText,
      required this.desecriptionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, bottom: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headerText,
                style: TextStyle(
                  fontFamily: 'Cera pro',
                  color: Pallete.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              desecriptionText,
              style: TextStyle(
                fontFamily: 'Cera pro',
                color: Pallete.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
