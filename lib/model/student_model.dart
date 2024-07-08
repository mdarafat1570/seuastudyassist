class Student {
  String name;
  String studentNumber;
  String studentId;
  String postCode;
  String facultyName;

  Student({
    required this.name,
    required this.studentNumber,
    required this.studentId,
    required this.postCode,
    required this.facultyName,
  });

  // Convert a Student into a Map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'studentNumber': studentNumber,
      'studentId': studentId,
      'postCode': postCode,
      'facultyName': facultyName,
    };
  }

  // Convert a Map into a Student.
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      studentNumber: map['studentNumber'],
      studentId: map['studentId'],
      postCode: map['postCode'],
      facultyName: map['facultyName'],
    );
  }
}
