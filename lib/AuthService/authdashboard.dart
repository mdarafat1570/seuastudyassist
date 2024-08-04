// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:seustudyassist/model/seu_student_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:seustudyassist/AuthService/endpoint.dart';

// class AuthService {
//   Future<Map<String, dynamic>?> signIn(String username, String password) async {
//     try {
//       Map<String, dynamic> payload = {
//         "username": username,
//         "password": password,
//         "browser": "Chrome",
//         "os": "Windows",
//         "agent":
//             "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36",
//         "ip": "undetected",
//         "deviceType": "Desktop",
//         "deviceBrand": "undetected",
//         "deviceModel": "undetected",
//         "deviceResolution": "1280*720",
//         "deviceBrowserResolution": "557*791",
//         "isp": "undetected",
//         "city": "undetected",
//         "country": "undetected",
//         "location": "undetected",
//         "timeZone": "Asia/Dhaka",
//         "attemptCount": 0,
//         "rememberMe": true
//       };

//       String body = json.encode(payload);
//       final response = await http.post(Uri.parse(Endpoints.signIn()),
//           headers: {
//             'Content-Type': 'application/json',
//           },
//           body: body);

//       if (response.statusCode == 200) {
//         Map<String, dynamic> data = json.decode(response.body);
//         String token = data['data']['token'];

//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('token', token);

//         final dashboardData = await fetchDashboardData();
//         if (dashboardData != null) {
//           SeuStudentModel student = SeuStudentModel.fromJson(dashboardData);
//           await prefs.setString('dashboardData', json.encode(student.toJson()));
//           return data['data'];
//         } else {
//           print('Failed to fetch dashboard data');
//           return null;
//         }
//       } else {
//         print('Failed to sign in: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Exception during sign in: $e');
//       return null;
//     }
//   }

//   Future<Map<String, dynamic>?> fetchDashboardData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');

//     if (token == null) {
//       print('No token found');
//       return null;
//     }

//     final response = await http.get(
//       Uri.parse(Endpoints.dashboard),
//       headers: {
//         'Authorization': 'Bearer $token',
//       },
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print('Failed to fetch dashboard data: ${response.statusCode}');
//       return null;
//     }
//   }

//   Future<void> deleteDashboardData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     await prefs.remove('dashboardData');
//     print('Dashboard data and token deleted');
//   }
// }
