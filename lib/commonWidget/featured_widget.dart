import 'package:flutter/material.dart';
import 'package:seustudyassist/dashboard/home_page.dart';

Widget featuredWidget(
    {required imagePath, required courseTitle, required noumberOfCourse}) {
  return ListTile(
    leading: Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(imagePath, fit: BoxFit.fill)),
    ),
    title: Text(courseTitle),
    subtitle: Text("$noumberOfCourse Lessons"),
  );
}

List<FeaturedCouseModel> fetures = [
  FeaturedCouseModel(
      courseTitle: "web Design",
      imagePath:
          "https://th.bing.com/th/id/OIP.PB3ZpIvrp1R0F_tUb7pbjQHaEK?rs=1&pid=ImgDetMain",
      numberOfCourse: "20"),
  FeaturedCouseModel(
      courseTitle: "game",
      imagePath:
          "https://th.bing.com/th/id/OIP.PB3ZpIvrp1R0F_tUb7pbjQHaEK?rs=1&pid=ImgDetMain",
      numberOfCourse: "23"),
  FeaturedCouseModel(
      courseTitle: "android",
      imagePath:
          "https://th.bing.com/th/id/OIP.PB3ZpIvrp1R0F_tUb7pbjQHaEK?rs=1&pid=ImgDetMain",
      numberOfCourse: "50"),
  FeaturedCouseModel(
      courseTitle: "Design",
      imagePath:
          "https://th.bing.com/th/id/OIP.PB3ZpIvrp1R0F_tUb7pbjQHaEK?rs=1&pid=ImgDetMain",
      numberOfCourse: "51"),
];
