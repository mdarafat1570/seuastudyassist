import 'package:flutter/material.dart';
import 'package:seustudyassist/commonWidget/commonDropdownWithTitle.dart';
import 'package:seustudyassist/commonWidget/commonTextfieldWithTitle.dart';
import 'package:seustudyassist/model/course_list.dart';
import 'package:seustudyassist/model/student_model.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController facultyNameController = TextEditingController();

  void submitStudent(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Student newStudent = Student(
        name: nameController.text,
        studentNumber: studentNumberController.text,
        studentId: studentIdController.text,
        postCode: postCodeController.text,
        facultyName: facultyNameController.text,
      );
      Navigator.pop(context, newStudent);
    }
  }     



  List<String> extractFacultyNames(List<Map<String, dynamic>> courseList) {
    List<String> facultyNames = [];
    for (var faculty in courseList) {
      if (faculty.containsKey('courseCode')) {
        facultyNames.add(faculty['courseCode']);
      }
    }
    return facultyNames;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Offered Sections'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonTextfieldWithTitle(
                  'Title',
                  true,
                  1,
                  nameController,
                  hint: 'Enter your name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 10),
                commonDropdownWithTitle(
                  title: 'Code',
                  isRequired: true,
                  selectedValue: 'Selected Value',
                  menuEntries: extractFacultyNames(courseList()),
                  onSelected: (value) {
                    setState(() {
                      facultyNameController.text = value ?? '';
                    });
                  },
                  context: context,
                ),
                SizedBox(height: 10),
                commonTextfieldWithTitle(
                  'Credits',
                  true,
                  1,
                  studentNumberController,
                  hint: 'Enter your Credits number',
                  keyboardInputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student number is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 10),
                commonDropdownWithTitle(
                  title: 'Faculty',
                  isRequired: true,
                  selectedValue: 'Selected Value',
                  menuEntries: extractFacultyNames(courseList()),
                  onSelected: (value) {
                    setState(() {
                      facultyNameController.text = value ?? '';
                    });
                  },
                  context: context,
                ),
                commonTextfieldWithTitle(
                  'Student ID',
                  true,
                  1,
                  studentIdController,
                  hint: 'Enter your student ID',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student ID is required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: commonTextfieldWithTitle(
                        'Post Code',
                        true,
                        1,
                        postCodeController,
                        hint: 'Enter your post code',
                        keyboardInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Post code is required';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                commonTextfieldWithTitle(
                  'Code',
                  false,
                  1,
                  facultyNameController,
                  hint: 'Enter your faculty name',
                  onChanged: (value) {},
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    commonDropdownWithTitle(
                      title: 'Faculty Name',
                      isRequired: true,
                      selectedValue: 'Selected Value',
                      menuEntries: extractFacultyNames(courseList()),
                      onSelected: (value) {
                        setState(() {
                          facultyNameController.text = value ?? '';
                        });
                      },
                      context: context,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                commonTextfieldWithTitle(
                  'Faculty Name',
                  false,
                  1,
                  facultyNameController,
                  hint: 'Enter your faculty name',
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => submitStudent(context),
                  child: Text('Add Student'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
