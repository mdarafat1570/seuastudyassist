import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seustudyassist/AuthService/authService.dart';
import 'package:seustudyassist/AuthService/endpoint.dart';
import 'package:seustudyassist/model/seu_student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  AuthService authService = AuthService();
  DashboardModel? studentModel;

  @override
  void initState() {
    super.initState();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token =
        prefs.getString('token'); 

    if (token == null) {
      print('No token found');
      return;
    }

    final url = Endpoints.dashboard;
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      setState(() {
        studentModel = DashboardModel.fromJson(json.decode(response.body));
      });

      prefs.setString('dashboardData', response.body);
    } else {
      print('Failed to load dashboard data: ${response.statusCode}');
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: studentModel == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First Name: ${studentModel!.name!.firstName ?? ''}'),
                  Text('Last Name: ${studentModel!.name!.lastName ?? ''}'),
                ],
              ),
            ),
    );
  }
}
