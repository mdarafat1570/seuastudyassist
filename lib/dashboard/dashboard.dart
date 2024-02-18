import 'package:flutter/material.dart';
import 'dart:async';
import 'package:seustudyassist/courseOnList/course_page.dart';
import 'package:seustudyassist/base/utils.dart';
import 'package:seustudyassist/facultiies_Seu/faculties_page.dart';
import 'package:seustudyassist/widgetFile/bottomnavigationbar.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Timer _timer;
  late ScrollController _scrollController;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 40, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text(
                    //       "Hey Md. Arafat Mia!",
                    //       style: TextStyle(
                    //         color: black,
                    //         fontSize: 16,
                    //         letterSpacing: 1,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     ),
                    //     Container(
                    //       height: 45,
                    //       width: 45,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(20),
                    //         child: Image.asset('assets/arafatnew.jpg'),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20.0),
                    Row(
                      children: [
                        const Text(
                          "CSC Faculties",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FacultiesPage()),
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
                    SizedBox(height: 10.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/cse/Shahriar-Manzoor.jpg",
                            ),
                          ),
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/cse/SS.png",
                            ),
                          ),
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/cse/Ashiqur_Rahman.jpg",
                            ),
                          ),
                          SizedBox(width: 16.0),
                          // Second row of images
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/cse/Roksana_Akter.jpg",
                            ),
                          ),
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/cse/AHQ.jpg",
                            ),
                          ),
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/eee/Shifat-Ahmed.jpg",
                            ),
                          ),
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/cse/BD.png",
                            ),
                          ),
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                              "https://www.seu.edu.bd/dept/dept_images/cse/sinthiaSobnom.jpg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Row(
                      children: [
                        Text(
                          "Club Activities",
                          style: TextStyle(
                            color: black,
                            fontSize: 17,
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: black,
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 200.0,
                            width: 320,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Image.asset(
                              'assets/SEUNoticeBord.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Container(
                            height: 200.0,
                            width: 320,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0),
                              ),
                            ),
                            child: Image.asset(
                              'assets/SEUNoticeBord.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoursePage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 200.0,
                              width: 320,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Image.asset(
                                'assets/SEUNoticeBord.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    const Text(
                      "Curriculum Details",
                      style: TextStyle(
                        color: black,
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar.appBottomNavigation(
        (index) {
          // Handle index change
        },
        0, // Initial selected index
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hey Mr Arafat! "),
          Container(
            height: 35,
            width: 35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/arafatnew.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
