import 'dart:convert';
import 'package:flutter_application_1/src/models/humidity_model.dart';
import 'package:flutter_application_1/src/models/luminosity_model.dart';
import 'package:flutter_application_1/src/models/precipitations_model.dart';
import 'package:flutter_application_1/src/models/pressure_model.dart';
import 'package:flutter_application_1/src/models/temperature_model.dart';
import 'package:http/http.dart' as http;

class MeteoService {
  Future<Map<String, num?>?> getHumidity() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/influxdb/get/humidity"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'start': '0', 'limit': '5000'}));

    if (response.statusCode == 200) {
      {
        var hi = await Humidity.fromJson(jsonDecode(response.body)).data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }

  Future<Map<String, num?>?> getLuminosity() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/influxdb/get/luminosity"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'start': '0', 'limit': '500'}));

    if (response.statusCode == 200) {
      {
        var hi = await Luminosity.fromJson(jsonDecode(response.body)).data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }

  // Future<Object?> getPrecipitations() async {
  //   final response = await http.post(
  //       Uri.parse("http://10.0.2.2:8000/api/influxdb/get/precipitations"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({'start': '0', 'limit': '100'}));

  //   if (response.statusCode == 200) {
  //     {
  //       var hi = await Precipitations.fromJson(jsonDecode(response.body)).data;
  //       return hi;
  //     }
  //   } else {
  //     print("data not ");
  //     return Precipitations();
  //   }
  // }

  Future<Map<String, num?>?> getPressure() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/influxdb/get/pressure"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'start': '0', 'limit': '100'}));

    if (response.statusCode == 200) {
      {
        var hi = await Pressure.fromJson(jsonDecode(response.body)).data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }

  Future<Map<String, num?>?> getTemperature() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/influxdb/get/temperature"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'start': '0', 'limit': '100'}));

    if (response.statusCode == 200) {
      {
        var hi = await Temperature.fromJson(jsonDecode(response.body)).data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }
}
