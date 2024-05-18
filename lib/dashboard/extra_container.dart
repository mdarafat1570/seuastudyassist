import 'package:flutter/material.dart';
import 'package:seustudyassist/CGP/cgpa_page.dart';
import 'package:seustudyassist/UMS/ums_web.dart';
import 'package:seustudyassist/academicCalender/academic_calender.dart';
import 'package:seustudyassist/aipage2/Chatbot.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:seustudyassist/commonWidget/slideNavigation.dart';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/coverPage/cover_page.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/info_fillup_screen.dart';
import 'package:seustudyassist/tuitionCalculator/Calculator_Screen.dart';

class ExtraContainer extends StatefulWidget {
  const ExtraContainer({super.key});

  @override
  State<ExtraContainer> createState() => _ExtraContainerState();
}

class _ExtraContainerState extends State<ExtraContainer> {

 
  @override
  Column buildCard(String imagePath, String text, Color color) {
    return Column(
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
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            child: Image.asset(imagePath),
          ),
        ),
        Text(text,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
     void slideNavigationPush2(Widget screen, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 210,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(UMSPage(), context);
                            },
                            child: buildCard('assets/LgoUMS.png', 'UMS\n',
                                AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(
                                  CGPACalculatorPage(), context);
                            },
                            child: buildCard('assets/CGPA.png',
                                'CGPA \n Calculator', AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(CoursePage(), context);
                            },
                            child: buildCard(
                                'assets/CurriculumDetails.png',
                                'Curriculum \n Details',
                                Color.fromARGB(255, 39, 55, 105))),
                        GestureDetector(
                          onTap: () {
                            slideNavigationPush2(InfoFillUpScreen(),
                                context); // Make sure 'context' is valid here
                          },
                          child: buildCard(
                              'assets/coverpageicon.png',
                              'Cover \n Page Generator',
                              Color.fromARGB(255, 39, 55, 105)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(CalculatorScreen(), context);
                            },
                            child: buildCard(
                                'assets/Tuitionfeesicon.png',
                                'Tuition Fee\nCalculator',
                                AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(Chatbot(), context);
                            },
                            child: buildCard(
                                'assets/SEU_AI.png',
                                'SEU\nStudy Assist Ai',
                                Color.fromARGB(255, 119, 128, 180))),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(
                                  AcademicCalenderPage(), context);
                            },
                            child: buildCard(
                                'assets/AcademicCalenderPage.png',
                                'Academic\nCalender',
                                Color.fromARGB(255, 39, 55, 105))),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(
                                  AcademicCalenderPage(), context);
                            },
                            child: buildCard('assets/The_clubs.png',
                                'SEU\nclubs', Color.fromARGB(255, 82, 82, 82))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(UMSPage(), context);
                            },
                            child: buildCard('assets/LgoUMS.png', 'UMS\n',
                                AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(
                                  CGPACalculatorPage(), context);
                            },
                            child: buildCard('assets/CGPA.png',
                                'CGPA \n Calculator', AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(CoursePage(), context);
                            },
                            child: buildCard(
                                'assets/CurriculumDetails.png',
                                'Curriculum \n Details',
                                Color.fromARGB(255, 39, 55, 105))),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(EssayCoverPage(), context);
                            },
                            child: buildCard(
                                'assets/coverpageicon.png',
                                'Cover  \n Page Generator',
                                Color.fromARGB(255, 39, 55, 105))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(CalculatorScreen(), context);
                            },
                            child: buildCard(
                                'assets/Tuitionfeesicon.png',
                                'Tuition Fee\nCalculator',
                                AppColor.primaryColor)),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(Chatbot(), context);
                            },
                            child: buildCard(
                                'assets/SEU_AI.png',
                                'SEU\nStudy Assist Ai',
                                Color.fromARGB(255, 119, 128, 180))),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(
                                  AcademicCalenderPage(), context);
                            },
                            child: buildCard(
                                'assets/AcademicCalenderPage.png',
                                'Academic\nCalender',
                                Color.fromARGB(255, 39, 55, 105))),
                        GestureDetector(
                            onTap: () {
                              slideNavigationPush(
                                  AcademicCalenderPage(), context);
                            },
                            child: buildCard('assets/The_clubs.png',
                                'SEU\nclubs', Color.fromARGB(255, 82, 82, 82))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}