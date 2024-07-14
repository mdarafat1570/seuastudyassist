import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seustudyassist/AuthService/endpoint.dart';


class AuthService {
  Future<Map<String, dynamic>?> signIn(String username, String password) async {
    try {
      Map<String, dynamic> payload = {
        "username": username,
        "password": password,
        "browser": "Chrome",
        "os": "Windows",
        "agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36",
        "ip": "undetected",
        "deviceType": "Desktop",
        "deviceBrand": "undetected",
        "deviceModel": "undetected",
        "deviceResolution": "1280*720",
        "deviceBrowserResolution": "557*791",
        "isp": "undetected",
        "city": "undetected",
        "country": "undetected",
        "location": "undetected",
        "timeZone": "Asia/Dhaka",
        "attemptCount": 0,
        "rememberMe": true
      };

      String body = json.encode(payload);
      final response = await http.post(Uri.parse(Endpoints.signIn()),
          headers: {
            'Content-Type': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
     
        Map<String, dynamic> data = json.decode(response.body);
        return data['data']; 
      } else {
     
        print('Failed to sign in: ${response.statusCode}');
        return null;
      }
    } catch (e) {
    
      print('Exception during sign in: $e');
      return null;
    }
  }
}
