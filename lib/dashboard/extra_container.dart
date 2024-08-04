import 'package:flutter/material.dart';
import 'package:seustudyassist/CGPA/cgpa_page.dart';
import 'package:seustudyassist/CamScanner/cam_scanner_page.dart';
import 'package:seustudyassist/MapSEU/Map_seu_page.dart';
import 'package:seustudyassist/SEU%20routine/routine_page.dart';
import 'package:seustudyassist/UMS/ums_web.dart';
import 'package:seustudyassist/academicCalender/academic_calender.dart';
import 'package:seustudyassist/aipage2/Chatbot.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/coverPage/cover_page.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/info_fillup_screen.dart';
import 'package:seustudyassist/facultiies_Seu/faculties_page.dart';
import 'package:seustudyassist/importantContacts/important_info_page.dart';

import 'package:seustudyassist/loginPageSEU/SEU_login_page.dart';
import 'package:seustudyassist/preRegistration/pre_registration_page.dart';
import 'package:seustudyassist/topNewsPage/top_news_page.dart';
import 'package:seustudyassist/tuitionCalculator/Calculator_Screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ExtraContainer extends StatefulWidget {
  const ExtraContainer({Key? key}) : super(key: key);

  @override
  State<ExtraContainer> createState() => _ExtraContainerState();
}

class _ExtraContainerState extends State<ExtraContainer> {
  int _currentPage = 0; // To keep track of the current page

  Widget buildCard(String imagePath, String text, Color color, Widget screen) {
    return GestureDetector(
      onTap: () {
        slideNavigationPush(screen, context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              width: 42,
              height: 42,
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              child: Image.asset(imagePath),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  void slideNavigationPush(Widget screen, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  List<Widget> buildPageIndicator() {
    return List<Widget>.generate(2, (int index) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 8,
        width: _currentPage == index ? 12 : 8,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: _currentPage == index ? Colors.blue : Colors.grey,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 220,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 210,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            items: [
              // First Page
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildCard('assets/LgoUMS.png', 'UMS\n',
                                AppColor.primaryColor, UMSPage()),
                            buildCard('assets/CGPA.png', 'CGPA \n Calculator',
                                AppColor.primaryColor, CGPACalculatorPage()),
                            buildCard(
                                'assets/CurriculumDetails.png',
                                'Curriculum \n Details',
                                Color.fromARGB(255, 39, 55, 105),
                                CoursePage()),
                            buildCard(
                                'assets/coverpageicon.png',
                                'Cover \n Page Generator',
                                Color.fromARGB(255, 39, 55, 105),
                                InfoFillUpScreen()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildCard(
                                'assets/Tuitionfeesicon.png',
                                'Tuition Fee\nCalculator',
                                AppColor.primaryColor,
                                CalculatorScreen()),
                            buildCard(
                                'assets/SEU_AI.png',
                                'SEU\nStudy Assist Ai',
                                Color.fromARGB(255, 119, 128, 180),
                                Chatbot()),
                            buildCard(
                                'assets/AcademicCalenderPage.png',
                                'Academic\nCalender',
                                Color.fromARGB(255, 39, 55, 105),
                                AcademicCalenderPage()),
                            buildCard(
                                'assets/The_clubs.png',
                                'SEU\nclubs',
                                Color.fromARGB(255, 82, 82, 82),
                                AcademicCalenderPage()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Second Page
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildCard(
                                'assets/important_info.png',
                                'Important \n info SEU ',
                                Color.fromARGB(255, 67, 155, 126),
                                ImportantInfoPage()),
                            buildCard(
                                'assets/Cam.png',
                                'CamScanner \n ',
                                const Color.fromARGB(255, 126, 173, 46),
                                CamScannerPage()),
                            buildCard(
                                'assets/Map.png',
                                'SEU Map \n Your location',
                                Color.fromARGB(255, 83, 39, 105),
                                SEUMapPage()),
                            buildCard(
                                'assets/sitProtal.png',
                                'Site \n Protal',
                                Color.fromARGB(255, 39, 55, 105),
                                EssayCoverPage()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildCard('assets/faculties.png', 'Faculties info',
                                AppColor.primaryColor, FacultiesPage()),
                            buildCard(
                                'assets/news.png',
                                'Top News',
                                Color.fromARGB(255, 119, 128, 180),
                                TopNewsPage()),
                            buildCard(
                                'assets/cafa.png',
                                'Course Schedule',
                                Color.fromARGB(255, 153, 171, 50),
                                CourseSchedulePage()),
                            buildCard(
                                'assets/Teacher_selection.png',
                                'Subject selection',
                                Color.fromARGB(255, 104, 47, 61),
                                StudentForm()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildPageIndicator(),
        ),
      ],
    );
  }
}
