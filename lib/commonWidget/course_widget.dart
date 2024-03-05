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
      imagePath:
          "https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/386591203_797190399079562_1671012837627492891_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=3635dc&_nc_eui2=AeE535YaOmvO8Y7GTrRdxwF9jRKw6MKmBPSNErDowqYE9GjKW-C7bCEgvcX4AZAeUKtWV7qCGuoFkiEtqqdWXCHr&_nc_ohc=4c0HgZOaVtsAX_G0rLJ&_nc_ht=scontent.fdac24-1.fna&oh=00_AfBYQG20cVDsDQOYm9OcRwUjF83Vs2pehwwmozJ5th5VBA&oe=65EB7732",
      name: "Flag Hunt 2023",
      rating: "4.5"),
  CouseModel(
      imagePath:
          "https://scontent.fdac24-4.fna.fbcdn.net/v/t39.30808-6/395296755_813003054164963_8300090360145525439_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=dd5e9f&_nc_eui2=AeElJIkCpkpE_-J-koAaQKlBazqvR9HLNchrOq9H0cs1yFWOhatiQ1c3czcd6v00Jqgifk2efIY8zEsLIngjbPLd&_nc_ohc=rsAft_gG1LkAX9hGD93&_nc_ht=scontent.fdac24-4.fna&oh=00_AfALSdfiCcIpN4vY9lVrt7klCQdICvxOziR1cGE5l6YHiw&oe=65EA371B",
      name: "Flag Hunt 2023",
      rating: "4.2"),
  CouseModel(
      imagePath:
          "https://scontent.fdac24-3.fna.fbcdn.net/v/t39.30808-6/366080180_762840635847872_3416538083857419940_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=dd5e9f&_nc_eui2=AeH59Bg3gAqxokBu8E06D7en4Raurhq-K5_hFq6uGr4rnxZaS2BYD93fdNgn2miL66442K59ra2fdaYNXMpBGw6D&_nc_ohc=zpvrechrci0AX-DLo26&_nc_ht=scontent.fdac24-3.fna&oh=00_AfDfV-Rg4jXAlCU-Re6h9BIa0C_jXFCt2nnNZW0d9a534A&oe=65EA257E",
      name: "Flag Hunt 2023",
      rating: "4.1"),
];
