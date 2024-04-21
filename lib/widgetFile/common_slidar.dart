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
      'https://scontent.fdac24-5.fna.fbcdn.net/v/t39.30808-6/431756355_817596530412653_8548616584774767172_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGJb54dgYjDPk8O7aQhTXOM4g1k15YVMA_iDWTXlhUwD8O-hurpXM9cA0177dF9qAO_wOCx-drh2UvXE5dQLSjn&_nc_ohc=3R4k4tQAxVIAb7bALr6&_nc_ht=scontent.fdac24-5.fna&oh=00_AfCk6qWD3TX0ml4u7JL4zve58PhNflfyfR6k69F12KbH2w&oe=662B14D4',
      'https://scontent.fdac24-3.fna.fbcdn.net/v/t39.30808-6/436266859_935415235257077_7433844372109771549_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEITYiBUCsWtxrKoRQupNV1zSVAeRi8B1nNJUB5GLwHWTcTqD3ZFEaJXIyDoomP73-CLtB1-T38zKFXbitpsDF4&_nc_ohc=pGYfXDhbsskAb5_JE1p&_nc_ht=scontent.fdac24-3.fna&oh=00_AfCwK8d0Z9CtglUv1QK82RbS8VvpccN5AwxEj7THi6kH6Q&oe=6625D8A3',
      'https://scontent.fdac24-2.fna.fbcdn.net/v/t39.30808-6/421440835_872219494909985_231759418949522710_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH4AOlM_5B5yxTnqclf5J8bC_LakZtBSLgL8tqRm0FIuDmyB3ygg_vdr0iNrrBVoWgGj3pt8Pwr_VWfCVrUhHVJ&_nc_ohc=Y6iX-LjFuoYAb4pq_w1&_nc_ht=scontent.fdac24-2.fna&oh=00_AfB7I4HxUAZr44Er_WRikyl2kYNVuOp2NVA_8Rb--LeptA&oe=662B3637',
      'https://scontent.fdac24-2.fna.fbcdn.net/v/t39.30808-6/437875190_935674678564466_8996440383354200311_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEZes3NnagdAz8pPy24OVvp496FGzsczCnj3oUbOxzMKTewpf101dkTK3G0Pl1WNuqW_iKXPdzmhkIikd4oQXG8&_nc_ohc=sFaTm6_vtpoAb711QlV&_nc_ht=scontent.fdac24-2.fna&oh=00_AfBMqM8Bg-YsIeDXvSxBlWZGm3TIhmF1nok_XHMsPAP67w&oe=6625DD0F',
      'https://scontent.fdac24-3.fna.fbcdn.net/v/t39.30808-6/436266859_935415235257077_7433844372109771549_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEITYiBUCsWtxrKoRQupNV1zSVAeRi8B1nNJUB5GLwHWTcTqD3ZFEaJXIyDoomP73-CLtB1-T38zKFXbitpsDF4&_nc_ohc=pGYfXDhbsskAb5_JE1p&_nc_ht=scontent.fdac24-3.fna&oh=00_AfCwK8d0Z9CtglUv1QK82RbS8VvpccN5AwxEj7THi6kH6Q&oe=6625D8A3',
    ].map((url) {
      return Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Stack(
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000,
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
