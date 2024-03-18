import 'package:flutter/material.dart';
import 'package:seustudyassist/dashboard/home_page.dart';

Widget courseWidget(
    {required imagePath, required courseName, required ratting}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 187, 243, 237),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(courseName),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber[800],
                    size: 18,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(ratting)
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        height: 115,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imagePath, fit: BoxFit.fill)),
      ),
    ],
  );
}

List<CouseModel> courses = [
  CouseModel(
      imagePath: "https://seu.edu.bd/slider/Summer-2024.png",
      name: "Flag Hunt 2023",
      rating: "4.5"),
  CouseModel(
      imagePath: "https://seu.edu.bd/slider/Conv7.jpg",
      name: "Flag Hunt 2023",
      rating: "4.2"),
  CouseModel(
      imagePath: "https://seu.edu.bd/slider/Slide6JobFair.JPG",
      name: "Flag Hunt 2023",
      rating: "4.1"),
];
