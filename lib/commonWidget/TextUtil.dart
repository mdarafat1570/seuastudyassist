import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  TextUtil({super.key, required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          wordSpacing: 0,
          color: color ?? Colors.black,
          fontSize: size ?? 14,
          fontWeight: weight == null ? FontWeight.normal : FontWeight.w500),
    );
  }
}
Widget customTextUI(String name, {color = Colors.white}) {
  return Text(name,
      style:
          TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold));
}