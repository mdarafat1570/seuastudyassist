import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget FacultyRow(
  String name,
  String position,
  String phoneNumber,
  String imageUrl,
  String email,
) {
  return InkWell(
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
              child: Stack(
                children: [
                  SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => Image.asset(
                        'assets/emptyprofile.png',
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/emptyprofile.png',
                        fit: BoxFit.cover,
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
                    name,
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
                      GestureDetector(
                        onTap: () {
                          launch('tel:$phoneNumber');
                        },
                        child: const Icon(
                          Icons.phone,
                          size: 16,
                          color: Color.fromARGB(255, 40, 128, 27),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        phoneNumber,
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch('mailto:$email');
                        },
                        child: const Icon(
                          Icons.email_outlined,
                          size: 16,
                          color: Color.fromARGB(255, 40, 128, 27),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        email,
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
                  Row(
                    children: [
                      Text(
                        "Position: ",
                        style: GoogleFonts.openSans(
                          letterSpacing: .5,
                          fontSize: 12,
                          color: const Color.fromARGB(255, 78, 100, 144),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          position,
                          style: GoogleFonts.openSans(
                            letterSpacing: .5,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 78, 100, 144),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (null),
                      child: Icon(
                        FontAwesomeIcons.circleInfo,
                        size: 16,
                        color: Color.fromARGB(255, 50, 46, 173),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                )
              ],
            )
          ],
        ),
        const Divider(
          color: Color.fromARGB(255, 232, 221, 221),
        ),
      ],
    ),
  );
}
