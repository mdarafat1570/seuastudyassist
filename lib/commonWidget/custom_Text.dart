import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seustudyassist/base/AppColour.dart';

Widget customText(String text,
    {Color color = AppColor.textThemeColor, double size = 14}) {
  return Text(
    text,
    style: GoogleFonts.openSans(
      letterSpacing: 0.5,
      color: color,
      fontSize: size,
    ),
  );
}

Widget customTextBold(String text,
    {Color color = AppColor.textThemeColor, double size = 14}) {
  return Text(
    text,
    style: GoogleFonts.openSans(
      letterSpacing: 0.5,
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}



