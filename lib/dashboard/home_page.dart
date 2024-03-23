import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seustudyassist/UMS/ums_web.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:seustudyassist/commonWidget/TextUtil.dart';
import 'package:seustudyassist/commonWidget/course_widget.dart';
import 'package:seustudyassist/commonWidget/custom_Text.dart';
import 'package:seustudyassist/commonWidget/slideNavigation.dart';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/facultiies_Seu/faculties_page.dart';
import 'package:seustudyassist/model/faculties_list.dart';
import 'package:seustudyassist/tuitionCalculator/Calculator_Screen.dart';

List<String> semesterList = [
  "First Semester",
  "Second Semester",
  "Third Semester",
  "Fourth Semester",
  "Fifth Semester",
  "Sixth Semester",
  "Seventh Semester",
  "Eighth Semester",
  "Ninth Semester",
  "Tenth Semester",
  "Eleventh Semester",
  "Twelfth Semester"
];

List<String> images = [
  "https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/366371599_684142767091364_7934293609394272_n.jpg?stp=cp6_dst-jpg&_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFSGwQevEsD_dQJqKYoZDJoqKJ2r6p4Hbeoonavqngdt3J-SvLbCIdokr8EghKUczc-BusZIM8GqVGNuzPOS5lK&_nc_ohc=45nbovgI3IEAX978q6z&_nc_ht=scontent.fdac24-1.fna&oh=00_AfB3wlZ3f8-tMwcHUWURp6y9pLjSHwuUXnEJ5GaV0DDMgQ&oe=65ECB662",
  "https://scontent.fdac24-2.fna.fbcdn.net/v/t39.30808-6/344212791_189543990173882_7126334929639264226_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGStTa_NDZBQIEGv_4g4aSB1pQ3GcDMMq3WlDcZwMwyrdjIEtXcfuWhCsnEwtMVif3NPkluX9aW18f06JObz1vQ&_nc_ohc=NR7RJx97yjMAX-dn5Nf&_nc_ht=scontent.fdac24-2.fna&oh=00_AfDFWuuhA_I938ucGKbnabbKDU6CLgLG_1oC2gx6H0SISg&oe=65ED504E",
  "https://scontent.fdac24-3.fna.fbcdn.net/v/t39.30808-6/341899927_893430208617830_5112707536010395804_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFNoSEwF9RUlsb3z1djXgG7pUbZnM1k0SSlRtmczWTRJNZbXJ6ZpPvUKXECik40rFrY0W5UJ8ehJhea5gmTpl7i&_nc_ohc=hxd7poOx94QAX9eFP3I&_nc_ht=scontent.fdac24-3.fna&oh=00_AfAX-O6Zmg5ROWx3ReT-13SYXrSelZXpHc51CIIu3MfxAQ&oe=65ED7422",
  "https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/409105456_379396328286566_8147063152433113164_n.jpg?stp=dst-jpg_s720x720&_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=aUzpVWvt2SsAX8pxiWq&_nc_ht=scontent.fdac24-1.fna&oh=00_AfDcDw3R2LlmOoOQoRw3DllMJ3LHeQVu-yQVpLgjTweh3A&oe=65ED37E8",
  "https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/409105456_379396328286566_8147063152433113164_n.jpg?stp=dst-jpg_s720x720&_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=aUzpVWvt2SsAX8pxiWq&_nc_ht=scontent.fdac24-1.fna&oh=00_AfDcDw3R2LlmOoOQoRw3DllMJ3LHeQVu-yQVpLgjTweh3A&oe=65ED37E8",
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();

  HomePage({
    super.key,
  });
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late Timer _timer;
  String _greeting = '';
  late ScrollController _scrollController;
  // PageController _pageController;
  int _currentPage = 0;
  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _setGreeting();
    _scrollController = ScrollController();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentScrollOffset = _scrollController.offset;
        if (currentScrollOffset < maxScrollExtent) {
          _scrollController.animateTo(
            maxScrollExtent,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  void _setGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (hour < 18) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        _greeting = 'Good Evening';
      });
    }
  }

  void disposepro() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  Column buildCard(String imagePath, String text, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 42,
            height: 42,
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            child: Image.asset(imagePath),
          ),
        ),
        Text(text,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage < images.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollNotificationObserver(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 225,
                    color: Colors.blue,
                    child: Image.asset(
                      "assets/coverpage.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 38),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(   
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextUI("$_greeting SEU!"), // Changed here
                              const CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage("assets/femalePhoto.jpg"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 95,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 5.0, bottom: 5),
                                child: Text("Find your course",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                height: 45,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Search",
                                          prefixIcon: Icon(Icons.search),
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow[900],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.mic_none,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            customTextBold("CSC Faculties",
                                size: 16, color: Colors.white),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FacultiesPage()),
                                );
                              },
                              child: customTextBold("View All",
                                  size: 13, color: Colors.white),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          child: SizedBox(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                ImageUrls.urls.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: CircleAvatar(
                                    radius: 33,
                                    backgroundImage: NetworkImage(
                                      ImageUrls.urls[index],
                                    ),
                                  ),
                                ),
                              ).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTextUI("Top Courses", color: Colors.black),
                          const Text(
                            "view All",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 150,
                        width: MediaQuery.sizeOf(context).width,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          itemCount: courses.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return courseWidget(
                                imagePath: courses[index].imagePath,
                                courseName: courses[index].name,
                                ratting: courses[index].rating);
                          },
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(UMSPage(), context);
                            },
                            child: buildCard('assets/LgoUMS.png', 'UMS\n',
                                AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {},
                            child: buildCard('assets/picone.png',
                                'CGPA \n Calculator', AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Row(
                                      children: [
                                        Icon(Icons.error, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text('Sorry'),
                                      ],
                                    ),
                                    content: Text(
                                        'This model is still under development'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: buildCard(
                                'assets/picone.png',
                                'Curriculum \n Details',
                                Color.fromARGB(255, 39, 55, 105))),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Row(
                                      children: [
                                        Icon(Icons.error, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text('Sorry'),
                                      ],
                                    ),
                                    content: Text(
                                        'This model is still under development'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: buildCard(
                                'assets/picone.png',
                                'Cover  \n Page Generator',
                                Color.fromARGB(255, 39, 55, 105))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(CalculatorScreen(), context);
                            },
                            child: buildCard(
                                'assets/Tuitionfees.png',
                                'Tuition Fee\nCalculator',
                                AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Row(
                                      children: [
                                        Icon(Icons.error, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text('Sorry'),
                                      ],
                                    ),
                                    content: Text(
                                        'This model is still under development'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: buildCard(
                                'assets/picone.png',
                                'CGPA \n Calculator',
                                Color.fromARGB(255, 39, 55, 105))),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Row(
                                      children: [
                                        Icon(Icons.error, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text('Sorry'),
                                      ],
                                    ),
                                    content: Text(
                                        'This model is still under development'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: buildCard(
                                'assets/picone.png',
                                'Curriculum \n Details',
                                Color.fromARGB(255, 39, 55, 105))),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Row(
                                      children: [
                                        Icon(Icons.error, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text('Sorry'),
                                      ],
                                    ),
                                    content: Text(
                                        'This model is still under development'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: buildCard(
                                'assets/picone.png',
                                'Cover  \n Page Generator',
                                Color.fromARGB(255, 39, 55, 105))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        customTextBold("Curriculum Details",
                            color: Colors.black, size: 16),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoursePage()),
                            );
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: semesterList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white54),
                                  borderRadius: BorderRadius.circular(120),
                                  color: selectedIndex == index
                                      ? AppColor.primaryColor
                                      : AppColor.accentColor),
                              alignment: Alignment.center,
                              child: TextUtil(
                                text: semesterList[index],
                                weight: true,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                  // SingleChildScrollView(
                  //   child: Container(
                  //     height: MediaQuery.of(context)
                  //         .size
                  //         .height, // Set a fixed height or use other desired constraints
                  //     child: ListView.separated(
                  //       scrollDirection: Axis.vertical,
                  //       separatorBuilder: (context, index) {
                  //         return const SizedBox(
                  //           height: 2,
                  //         );
                  //       },
                  //       itemCount: CourseLIst().length,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, index) {
                  //         final fachcourseList = CourseLIst()[index];
                  //         return courserow(
                  //           fachcourseList['courseCode'],
                  //           fachcourseList['courseTitle'],
                  //           fachcourseList['credits'],
                  //           fachcourseList['courseType'],
                  //           fachcourseList['CoursePrototype'],
                  //           onDetailsClick: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => DetailsPage(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        // bottomNavigationBar: AppBottomNavigationBar.appBottomNavigation(
        //   (index) {},
        //   1,
        // ),
      ),
    );
  }
}

class CouseModel {
  String name, rating, imagePath;
  CouseModel(
      {required this.imagePath, required this.name, required this.rating});
}

class FeaturedCouseModel {
  String courseTitle, numberOfCourse, imagePath;
  FeaturedCouseModel(
      {required this.imagePath,
      required this.courseTitle,
      required this.numberOfCourse});
}









// Container(
//       height: 225,
//       child: CarouselSlider.builder(
//         itemCount: images.length,
//         options: CarouselOptions(
//           autoPlay: true,
//           autoPlayInterval: Duration(seconds: 3),
//           autoPlayAnimationDuration: Duration(milliseconds: 800),
//           enlargeCenterPage: true,
//           onPageChanged: (index, reason) {
//             setState(() {
//               _currentPage = index;
//             });
//           },
//         ),
//         itemBuilder: (context, index, realIndex) {
//           return Container(
//             width: MediaQuery.of(context).size.width,
//             color: Colors.blue,
//             child: Image.network(
//               images[index],
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//       ),
//     );
