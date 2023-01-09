import 'dart:convert';
import 'package:flutter_application_1/src/models/humidity_model.dart';
import 'package:http/http.dart' as http;

class MeteoService {
  Future<Humidity> getHumidity() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/influxdb/get/humidity"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'start': '0', 'limit': '100'}));

    if (response.statusCode == 200) {
      {
        print("lehna");
        return Humidity.fromJson(jsonDecode(response.body));
      }
    } else {
      print("data not ");
      return Humidity();
    }
  }
}
