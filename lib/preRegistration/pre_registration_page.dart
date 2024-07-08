import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:seustudyassist/model/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddStudentPage.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  void loadStudents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentsString = prefs.getString('students');
    if (studentsString != null) {
      List<dynamic> studentsList = jsonDecode(studentsString);
      setState(() {
        students = studentsList.map((e) => Student.fromMap(e)).toList();
      });
    }
  }

  void saveStudents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String studentsString = jsonEncode(students.map((e) => e.toMap()).toList());
    prefs.setString('students', studentsString);
  }

  void addStudent(Student student) {
    setState(() {
      students.add(student);
      saveStudents();
    });
  }

  void editStudent(int index) {}

  void updateStudent(int index) {}

  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
      saveStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offered Sections'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index].name),
                    subtitle: Text(
                        'Student Number: ${students[index].studentNumber}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            editStudent(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteStudent(index);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      updateStudent(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newStudent = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentPage()),
          );
          if (newStudent != null) {
            addStudent(newStudent);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
