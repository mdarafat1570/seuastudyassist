import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:velocity_x/velocity_x.dart';

Widget commonDropdownWithTitle({
  required String title,
  required bool isRequired,
  required String selectedValue,
  required List<String> menuEntries,
  required Function(String?) onSelected,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          title.text
              .size(12)
              .textStyle(GoogleFonts.openSans(letterSpacing: .5))
              .color(AppColor.textThemeColor)
              .make()
              .box
              .margin(const EdgeInsets.only(left: 6))
              .make(),
          Visibility(
            visible: isRequired,
            child: "*"
                .text
                .size(12)
                .textStyle(GoogleFonts.openSans(letterSpacing: .5))
                .color(Colors.red)
                .bold
                .make()
                .box
                .margin(const EdgeInsets.only(left: 1))
                .make(),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      DropdownMenu<String>(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(10),
          constraints: BoxConstraints.expand(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                width: 1.2, color: Color.fromARGB(255, 198, 204, 215)),
          ),
        ),
        initialSelection: selectedValue,
        onSelected: (String? value) {
          onSelected(value);
        },
        menuStyle: MenuStyle(
          surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        textStyle:
            const TextStyle(color: AppColor.textThemeColor, fontSize: 12),
        dropdownMenuEntries:
            menuEntries.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(
            value: value,
            label: value,
          );
        }).toList(),
      ),
    ],
  ).box.width(MediaQuery.of(context).size.width * 0.3).make();
}
