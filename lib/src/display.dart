import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'map.dart';

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

  @override
  DisplayState createState() => DisplayState();
}

class DisplayState extends State<Display> {
  List<ChartSampleData> chartHumidity = <ChartSampleData>[
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][0]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][0]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][5]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][5]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][10]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][10]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][20]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][20]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][30]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][30]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][40]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][40]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][50]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][50]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalHumidity[0][60]),
        yValue: double.parse(MyMapPage.finalHumidity[1]
                [MyMapPage.finalHumidity[0][60]]
            .toString())),
  ];

//
//
//
  //
  List<ChartSampleData> chartTemperature = <ChartSampleData>[
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][0]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][0]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][5]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][5]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][10]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][10]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][20]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][20]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][30]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][30]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][40]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][40]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][50]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][50]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalTemperature[0][60]),
        yValue: double.parse(MyMapPage.finalTemperature[1]
                [MyMapPage.finalTemperature[0][60]]
            .toString())),
  ];
  //
//
//
  //
  List<ChartSampleData> chartPressure = <ChartSampleData>[
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][0]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][0]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][5]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][5]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][10]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][10]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][20]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][20]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][30]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][30]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][40]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][40]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][50]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][50]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalPressure[0][60]),
        yValue: double.parse(MyMapPage.finalPressure[1]
                [MyMapPage.finalPressure[0][60]]
            .toString())),
  ];
  //
//
//
  //
  List<ChartSampleData> chartLuminosity = <ChartSampleData>[
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][0]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][0]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][5]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][5]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][10]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][10]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][20]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][20]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][30]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][30]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][40]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][40]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][50]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][50]]
            .toString())),
    ChartSampleData(
        x: DateTime.parse(MyMapPage.finalLuminosity[0][60]),
        yValue: double.parse(MyMapPage.finalLuminosity[1]
                [MyMapPage.finalLuminosity[0][60]]
            .toString())),
  ];
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
                            dataSource: chartTemperature,
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
                            dataSource: chartHumidity,
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
                            dataSource: chartPressure,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            yValueMapper: (ChartSampleData sales, _) =>
                                sales.yValue,
                            name: 'Sales',
                          )
                        ])),
                Title(color: Colors.black, child: Text("Luminosity")),
                Container(
                    height: 500,
                    width: 800,
                    child: SfCartesianChart(
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          LineSeries<ChartSampleData, DateTime>(
                            dataSource: chartLuminosity,
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

class ChartSampleData {
  ChartSampleData({this.x, this.yValue});

  final DateTime? x;
  final double? yValue;
}
