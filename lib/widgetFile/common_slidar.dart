import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// ignore: slash_for_doc_comments
/**
//Credit by MD Arafat Mia (Date: 22-04-2024)
 */

class CommonCarouselSlider extends StatefulWidget {
  @override
  _CommonCarouselSliderState createState() => _CommonCarouselSliderState();
}

class _CommonCarouselSliderState extends State<CommonCarouselSlider> {
  int _current = 0;
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = [
      'https://i.ibb.co/QFP1tqp/437875190-935674678564466-8996440383354200311-n.jpg',
      'https://i.ibb.co/jw1ZjC0/Purple-and-Red-Neon-Game-Youtube-Intro.png',
      'https://i.ibb.co/stYn1Fr/SEUCLub.png',
      'https://i.ibb.co/0c5rdVH/SEUCLub2.png',
    ].map((url) {
     return Container(
  margin: EdgeInsets.all(10),
  child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: Stack(
      children: [
        CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          width: 1000,
          placeholder: (context, url) => CircularProgressIndicator(), // Placeholder widget while loading
          errorWidget: (context, url, error) => Icon(Icons.error), // Widget to display in case of error
        ),
      ],
    ),
  ),
);

    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            items: imageSlider,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageSlider.asMap().entries.map((entry) {
              int index = entry.key;
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
