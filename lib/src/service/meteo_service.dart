import 'dart:convert';
import 'package:flutter_application_1/src/models/humidity_model.dart';
import 'package:http/http.dart' as http;

class MeteoService {
  Future<Humidity> getHumidity() async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/influxdb/get/humidity"),
      headers: <String, String>{
        'Content-Type': 'Content-Type: application/x-www-form-urlencode',
      },
    );

    if (response.statusCode == 200) {
      {
        return Humidity.fromJson(jsonDecode(response.body));
      }
    } else {
      print("data not available");
      return Humidity();
    }
  }
}
