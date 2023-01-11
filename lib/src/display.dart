import 'package:CertNodes/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'map.dart';

class ChartSampleData {
  ChartSampleData({this.x, this.yValue});

  final DateTime? x;
  final double? yValue;
}

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Display(),
    );
  }
}

class Display extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Display({Key? key}) : super(key: key);
  static List<ChartSampleData> chartTemperature = <ChartSampleData>[];
  static List<ChartSampleData> chartHumidity = <ChartSampleData>[];
  static List<ChartSampleData> chartPressure = <ChartSampleData>[];
  static List<ChartSampleData> chartLuminosity = <ChartSampleData>[];

  @override
  DisplayState createState() => DisplayState();
}

class DisplayState extends State<Display> {
  handleData() {
    Display.chartTemperature = <ChartSampleData>[];
    Display.chartHumidity = <ChartSampleData>[];
    Display.chartPressure = <ChartSampleData>[];
    Display.chartLuminosity = <ChartSampleData>[];
    for (int i = 0; i < 150; i++) {
      Display.chartTemperature.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalTemperature[0][i]),
        yValue: double.parse(WelcomePage.finalTemperature[1]
                [WelcomePage.finalTemperature[0][i]]
            .toString()),
      ));
    }
    for (int i = 0; i < 150; i++) {
      Display.chartHumidity.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalHumidity[0][i]),
        yValue: double.parse(WelcomePage.finalHumidity[1]
                [WelcomePage.finalHumidity[0][i]]
            .toString()),
      ));
    }

    for (int i = 0; i < 150; i++) {
      Display.chartLuminosity.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalLuminosity[0][i]),
        yValue: double.parse(WelcomePage.finalLuminosity[1]
                [WelcomePage.finalLuminosity[0][i]]
            .toString()),
      ));
    }
    for (int i = 0; i < 150; i++) {
      Display.chartPressure.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalPressure[0][i]),
        yValue: double.parse(WelcomePage.finalPressure[1]
                [WelcomePage.finalPressure[0][i]]
            .toString()),
      ));
    }
  }

  @override
  void initState() {
    handleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Charts'), backgroundColor: Color(0xfff7892b)),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: SingleChildScrollView(
            //Initialize the chart widget
            child: Column(
              children: [
                Title(color: Colors.black, child: Text("Temperature")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          LineSeries<ChartSampleData, DateTime>(
                            dataSource: Display.chartTemperature,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            yValueMapper: (ChartSampleData sales, _) =>
                                sales.yValue,
                            name: 'Sales',
                          )
                        ])),
                Title(color: Colors.black, child: Text("Humidity")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          LineSeries<ChartSampleData, DateTime>(
                            dataSource: Display.chartHumidity,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            yValueMapper: (ChartSampleData sales, _) =>
                                sales.yValue,
                            name: 'Sales',
                          )
                        ])),
                Title(color: Colors.black, child: Text("Pressure")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          LineSeries<ChartSampleData, DateTime>(
                            dataSource: Display.chartPressure,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            yValueMapper: (ChartSampleData sales, _) =>
                                sales.yValue,
                            name: 'Sales',
                          )
                        ])),
                Title(color: Colors.black, child: Text("Luminosity")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          LineSeries<ChartSampleData, DateTime>(
                            dataSource: Display.chartLuminosity,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            yValueMapper: (ChartSampleData sales, _) =>
                                sales.yValue,
                            name: 'Sales',
                          )
                        ])),
              ],
            ),
          ),
        ));
  }
}
