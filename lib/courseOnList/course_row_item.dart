import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:velocity_x/velocity_x.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

Widget courserow(String courseCode, String courseTitle, String credits,
    String courseType, String CoursePrototype,
    {required VoidCallback onDetailsClick}) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const SizedBox(
                        height: 5,
                      ),
                      courseTitle.text
                          .textStyle(GoogleFonts.openSans(letterSpacing: .5))
                          .bold
                          .size(14)
                          .overflow(TextOverflow.ellipsis)
                          .color(const Color.fromARGB(255, 78, 100, 144))
                          .make(),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Course Code : ",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Expanded(
                            child: courseCode.text
                                .textStyle(
                                    GoogleFonts.openSans(letterSpacing: .5))
                                .size(12)
                                .color(AppColor.primaryColor)
                                .make(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Course Prototype : ",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          CoursePrototype.text
                              .textStyle(
                                  GoogleFonts.openSans(letterSpacing: .5))
                              .size(12)
                              .color(AppColor.primaryColor)
                              .make(),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Credits : ",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          credits.text
                              .textStyle(
                                  GoogleFonts.openSans(letterSpacing: .5))
                              .size(12)
                              .color(AppColor.primaryColor)
                              .make(),
                        ],
                      ),
                    ])
                    .box
                    .padding(
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5))
                    .make(),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: onDetailsClick,
                          child: const Icon(
                            FontAwesomeIcons.arrowDownWideShort,
                            size: 16,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "1st",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    (courseType)
                        .text
                        .size(14)
                        .color(AppColor.primaryColor)
                        .textStyle(GoogleFonts.openSans(letterSpacing: .5))
                        .bold
                        .make(),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: onDetailsClick,
                      child: const Icon(
                        FontAwesomeIcons.circleInfo,
                        size: 16,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                )
              ],
            )
          ],
        ),
        const Divider(
          color: Color.fromARGB(255, 226, 226, 226),
        )
      ],
    ),
  );
}
