import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seustudyassist/base/utils.dart';
import 'package:seustudyassist/commonWidget/TextUtil.dart';
import 'package:seustudyassist/commonWidget/course_widget.dart';
import 'package:seustudyassist/commonWidget/custom_Text.dart';
import 'package:seustudyassist/commonWidget/featured_widget.dart';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/courseOnList/course_row_item.dart';
import 'package:seustudyassist/courseOnList/detail_page.dart';
import 'package:seustudyassist/facultiies_Seu/faculties_page.dart';
import 'package:seustudyassist/model/course_list.dart';
import 'package:seustudyassist/model/faculties_list.dart';
import 'package:seustudyassist/widgetFile/bottomnavigationbar.dart';

class HomePage extends StatefulWidget {
  String name;
  @override
  State<HomePage> createState() => _HomePageState();

  HomePage(String s, {super.key, required this.name});
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  late ScrollController _scrollController;
  // PageController _pageController;
  int _currentPage = 0;

  void openVoiceCommand() {
    const platform = MethodChannel('com.example.voice_command');

    try {
      platform.invokeMethod('openVoiceCommand');
    } on PlatformException catch (e) {
      print("Failed to open voice command: '${e.message}'.");
    }
  }

  @override
  void initState() {
    super.initState();
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

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollNotificationObserver(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 225,
                  color: Colors.blue,
                  child: Image.network(
                      "https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-6/409105456_379396328286566_8147063152433113164_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=3635dc&_nc_ohc=aUzpVWvt2SsAX_b8YfG&_nc_ht=scontent.fdac24-1.fna&oh=00_AfBAOvIROL-sLY_tJvoUkVLh-zfObs1zxT58ODHvmtJ2Gw&oe=65EB3DA8",
                      fit: BoxFit.cover),
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
                            customTextUI("Hey ${widget.name}!"),
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 23.0,
                                backgroundImage: NetworkImage(
                                  "https://scontent.fdac24-2.fna.fbcdn.net/v/t39.30808-6/428614738_423722423344507_4441518714548931900_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeGNvX-FhJm_DAbtSxeafawEE_fP76Z7q0wT98_vpnurTAyFPCzHEHZizVw5BPfUGOLlhUflVP0SM0fgOak_CCFh&_nc_ohc=70Q-yMreKzYAX8wRGT8&_nc_ht=scontent.fdac24-2.fna&oh=00_AfC9ehMPCObd3CUazV8Owa6uWA26QZbfcsACtJkb_cOvjQ&oe=65EA0F41",
                                ),
                              ),
                            )
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
                      // const Text(
                      //   "view all",
                      //   style: TextStyle(color: Colors.blue),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       customTextUI("Top Mantors"),
                      //       const Text(
                      //         "view all",
                      //         style: TextStyle(color: Colors.blue),
                      //       )
                      //     ],
                      //   ),
                      // ),
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
            Flexible(
                child: SingleChildScrollView(
              child: Column(
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
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                    child: Column(children: [
                      Row(
                        children: [
                          customTextBold("   Curriculum Details",
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
                      SingleChildScrollView(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 2,
                            );
                          },
                          itemCount: CourseLIst().length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final fachcourseList = CourseLIst()[index];
                            return courserow(
                              fachcourseList['courseCode'],
                              fachcourseList['courseTitle'],
                              fachcourseList['credits'],
                              fachcourseList['courseType'],
                              fachcourseList['CoursePrototype'],
                              onDetailsClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage()),
                                );
                              },
                            );
                          },
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ))
          ],
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
