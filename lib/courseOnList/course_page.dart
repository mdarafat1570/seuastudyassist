import 'package:flutter/material.dart';

import 'package:seustudyassist/courseOnList/course_row_item.dart';
import 'package:seustudyassist/courseOnList/detail_page.dart';
import 'package:seustudyassist/model/course_list.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Curriculum Details",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Search',
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.all(9),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 213, 213, 213)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 158, 210, 253)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: CourseLIst().length,
              itemBuilder: (context, index) {
                final fachcourseList = CourseLIst()[index];
                return courserow(
                  fachcourseList['courseCode'],
                  fachcourseList['courseTitle'],
                  fachcourseList['credits'],
                  fachcourseList['courseType'],
                  fachcourseList['CoursePrototype'],
                  fachcourseList["Semester"],
                  onDetailsClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
