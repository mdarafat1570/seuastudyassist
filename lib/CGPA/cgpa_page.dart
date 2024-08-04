import 'package:flutter/material.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:seustudyassist/commonWidget/custom_Text.dart';

class CGPACalculatorPage extends StatefulWidget {
  @override
  _CGPACalculatorPageState createState() => _CGPACalculatorPageState();
}

class _CGPACalculatorPageState extends State<CGPACalculatorPage> {
  final List<TextEditingController> creditControllers = [];
  final List<TextEditingController> gradePointControllers = [];
  List<bool> isSubjectDeleted = [];
  int numberOfSubjects = 1;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    creditControllers.clear();
    gradePointControllers.clear();
    for (int i = 0; i < numberOfSubjects; i++) {
      creditControllers.add(TextEditingController());
      gradePointControllers.add(TextEditingController());
      isSubjectDeleted.add(false);
    }
  }

  void _addSubject() {
    setState(() {
      numberOfSubjects++;
      _initializeControllers();
    });
  }

  void _deleteSubject(int index) {
    setState(() {
      numberOfSubjects--;
      creditControllers.removeAt(index);
      gradePointControllers.removeAt(index);
      isSubjectDeleted.removeAt(index);
    });
  }

  void calculateCGPA() {
    double totalPoints = 0.0;
    int totalCredits = 0;
    for (int i = 0; i < numberOfSubjects; i++) {
      double credit = double.tryParse(creditControllers[i].text) ?? 0.0;
      double gradePoint = double.tryParse(gradePointControllers[i].text) ?? 0.0;
      totalPoints += credit * gradePoint;
      totalCredits += credit.toInt();
    }
    double cgpa = totalPoints / totalCredits;

    String grade;
    if (cgpa >= 4.0) {
      grade = 'A';
    } else if (cgpa >= 3.0) {
      grade = 'B';
    } else if (cgpa >= 2.0) {
      grade = 'C';
    } else if (cgpa >= 1.0) {
      grade = 'D';
    } else {
      grade = 'F';
    }

    showModalBottomSheet(
      backgroundColor: AppColor.primaryColor,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CGPA & Grade',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text('Total Credits: $totalCredits'),
              Text('Total Points: ${totalPoints.toStringAsFixed(2)}'),
              Text('Your CGPA is: ${cgpa.toStringAsFixed(2)}'),
              Text('Your Grade is: $grade'),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "CGPA Calculator",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  for (int i = 0; i < numberOfSubjects; i++)
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Card(
                        color: AppColor.accentColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text('Subject ${i + 1}:'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Credit'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        commonTextfield(
                                          1,
                                          creditControllers[i],
                                          width: 300,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Grade Point'),
                                        commonTextfield(
                                          1,
                                          gradePointControllers[i],
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete_forever_outlined),
                                    color: Colors.redAccent,
                                    onPressed: () {
                                      _deleteSubject(i);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      _addSubject();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: EdgeInsets.zero,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.2,
                        50.0,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Subject',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      calculateCGPA();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: EdgeInsets.zero,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.2,
                        50.0,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Calculate CGPA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
