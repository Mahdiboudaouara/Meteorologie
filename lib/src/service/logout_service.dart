import 'dart:convert';
import 'package:http/http.dart' as http;

class LogoutService {
  Future<bool> logout() async {
    final response = await http.get(
      Uri.parse("http://localhost:3000/api/signout"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      {
        return true;
      }
    } else {
      print('Logging out failed');
      return false;
    }
  }
}
