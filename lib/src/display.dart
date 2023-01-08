import 'package:flutter/material.dart';
import 'map.dart';

class WeatherForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '75°',
            style: TextStyle(
              fontSize: 48,
            ),
          ),
          Text(
            'Sunny',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
