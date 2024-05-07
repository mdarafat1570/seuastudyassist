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
  late List<Map<String, dynamic>> _filteredCourseList;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCourseList = courseList();
  }

  void _filterCourses(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredCourseList = courseList();
        return;
      }
      _filteredCourseList = courseList().where((course) {
        final String code = course['courseCode'].toString().toLowerCase();
        final String title = course['courseTitle'].toString().toLowerCase();
        final String semester = course['Semester'].toString().toLowerCase();
        final String query = searchText.toLowerCase();

        return code.contains(query) ||
            title.contains(query) ||
            semester.contains(query);
      }).toList();
    });
  }

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
                      controller: _searchController,
                      onChanged: _filterCourses,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.all(9),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
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
              itemCount: _filteredCourseList.length,
              itemBuilder: (context, index) {
                final course = _filteredCourseList[index];
                return courserow(
                  course['courseCode'],
                  course['courseTitle'],
                  course['credits'],
                  course['courseType'],
                  course['CoursePrototype'],
                  course['Semester'],
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
