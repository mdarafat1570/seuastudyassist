import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class Faculty {
  final String name;
  final String imageAsset;
  final String phoneNumber;

  Faculty({
    required this.name,
    required this.imageAsset,
    required this.phoneNumber,
  });
}

Widget customersRow(BuildContext context) {
  return VxBox(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Stack(
                children: [
                  SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: Image(
                      image: NetworkImage(
                        "https://www.seu.edu.bd/dept/dept_images/cse/Shahriar-Manzoor.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mr. Shahriar Manzoor",
                    style: GoogleFonts.openSans(
                      letterSpacing: .5,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromARGB(255, 78, 100, 144),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 16,
                        color: Color.fromARGB(255, 47, 237, 18),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "2226603610-7",
                        style: GoogleFonts.openSans(
                          letterSpacing: .5,
                          fontSize: 12,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(),
                  Text(
                    "Position: Associate Professor & Chairman",
                    style: GoogleFonts.openSans(
                      letterSpacing: .5,
                      fontSize: 12,
                      color: const Color.fromARGB(255, 78, 100, 144),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 0),
              child: PopupMenuButton<SampleItem>(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                iconSize: 16,
                iconColor: const Color.fromARGB(255, 171, 171, 171),
                initialValue: null,
                onSelected: (SampleItem item) {
                  if (item == SampleItem.itemOne) {
                  } else if (item == SampleItem.itemTwo) {
                  } else if (item == SampleItem.itemThree) {}
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SampleItem>>[
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemOne,
                    child: Text('Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: Color.fromARGB(255, 232, 221, 221),
        ),
      ],
    ),
  ).margin(const EdgeInsets.all(10)).make();
}
