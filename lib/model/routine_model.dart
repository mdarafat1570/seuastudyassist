class Course {
  final String section;
  final String title;
  final String schedule;
  final String room;

  Course({
    required this.section,
    required this.title,
    required this.schedule,
    required this.room,
  });

  Map<String, dynamic> toMap() {
    return {
      'section': section,
      'title': title,
      'schedule': schedule,
      'room': room,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      section: map['section'],
      title: map['title'],
      schedule: map['schedule'],
      room: map['room'],
    );
  }
}
