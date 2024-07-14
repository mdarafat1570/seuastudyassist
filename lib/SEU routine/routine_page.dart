import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:seustudyassist/commonWidget/commonTextfieldWithTitle.dart';
import 'package:seustudyassist/commonWidget/custom_Text.dart';
import 'package:seustudyassist/model/routine_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CourseSchedulePage extends StatefulWidget {
  @override
  _CourseSchedulePageState createState() => _CourseSchedulePageState();
}

class _CourseSchedulePageState extends State<CourseSchedulePage> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    loadCourses();
  }

  Future<void> loadCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? coursesString = prefs.getString('courses');
    if (coursesString != null) {
      final List<dynamic> courseList = jsonDecode(coursesString);
      setState(() {
        courses = courseList.map((json) => Course.fromMap(json)).toList();
      });
    }
  }

  Future<void> saveCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final String coursesString =
        jsonEncode(courses.map((course) => course.toMap()).toList());
    await prefs.setString('courses', coursesString);
  }

  void addCourse(Course course) {
    setState(() {
      courses.add(course);
      saveCourses();
    });
  }

  void editCourse(int index, Course course) {
    setState(() {
      courses[index] = course;
      saveCourses();
    });
  }

  void deleteCourse(int index) {
    setState(() {
      courses.removeAt(index);
      saveCourses();
    });
  }

  Future<void> showEditDialog(BuildContext context, [int? index]) async {
    final isEditing = index != null;
    final course = isEditing
        ? courses[index!]
        : Course(section: '', title: '', schedule: '', room: '');

    final sectionController = TextEditingController(text: course.section);
    final titleController = TextEditingController(text: course.title);
    final scheduleController = TextEditingController(text: course.schedule);
    final roomController = TextEditingController(text: course.room);

    final formKey = GlobalKey<FormState>();

    final result = await showDialog<Course>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Course' : 'Add Course'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                commonTextfieldWithTitle(
                  'Section',
                  true,
                  1,
                  sectionController,
                  hint: 'Enter your Section',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Section is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                commonTextfieldWithTitle(
                  'Title',
                  true,
                  1,
                  titleController,
                  hint: 'Enter your Title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                commonTextfieldWithTitle(
                  'Schedule',
                  true,
                  1,
                  scheduleController,
                  hint: 'Enter your Schedule',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Schedule is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                commonTextfieldWithTitle(
                  'Room',
                  true,
                  1,
                  roomController,
                  hint: 'Enter your Room',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Room is required';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final newCourse = Course(
                  section: sectionController.text,
                  title: titleController.text,
                  schedule: scheduleController.text,
                  room: roomController.text,
                );
                Navigator.of(context).pop(newCourse);
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );

    if (result != null) {
      if (isEditing) {
        editCourse(index!, result);
      } else {
        addCourse(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Course Schedule'),
      ),
      body: courses.isEmpty
          ? Center(child: Image.asset('assets/EmptyLayout.jpg'))
          : ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  color: AppColor.white,
                  margin: EdgeInsets.all(8.0),
                  elevation: 1.0,
                  child: ListTile(
                    title: Text(course.title),
                    subtitle: Text(
                        '${course.section}\n${course.schedule} @${course.room}'),
                    isThreeLine: true,
                    trailing: PopupMenuButton<String>(
                      onSelected: (String value) {
                        switch (value) {
                          case 'edit':
                            showEditDialog(context, index);
                            break;
                          case 'delete':
                            deleteCourse(index);
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: ListTile(
                            title: Text('Edit'),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: ListTile(
                            title: Text('Delete'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () => showEditDialog(context),
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
    );
  }
}
