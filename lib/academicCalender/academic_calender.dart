import 'package:flutter/material.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AcademicCalenderPage extends StatefulWidget {
  const AcademicCalenderPage({Key? key}) : super(key: key);

  @override
  _AcademicCalenderPageState createState() => _AcademicCalenderPageState();
}

class _AcademicCalenderPageState extends State<AcademicCalenderPage> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(_selectedDay);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Academic Calendar",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: AppColor.secondaryColor1000,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDate,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondaryColor150),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2050, 1, 1),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ),
            Image.asset(
              "assets/AcademicCalender1.png",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/AcademicCalender222.png",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/AcademicCalender3.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
