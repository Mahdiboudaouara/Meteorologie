import 'package:CertNodes/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

late ZoomPanBehavior _zoomPanBehaviorTemperature;
late ZoomPanBehavior _zoomPanBehaviorLuminosity;
late ZoomPanBehavior _zoomPanBehaviorPressure;
late ZoomPanBehavior _zoomPanBehaviorHumidity;
late TooltipBehavior _tooltipBehaviorTemperature;
late TooltipBehavior _tooltipBehaviorLuminosity;
late TooltipBehavior _tooltipBehaviorPressure;
late TooltipBehavior _tooltipBehaviorHumidity;

class ChartSampleData {
  ChartSampleData({this.x, this.yValue});
  static List<String> list = <String>[
    'ColumnSeries',
    'LineSeries',
    'SplineSeries'
  ];
  static List<dynamic> temperatureListWidget = [
    ColumnSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartTemperature,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Temperature',
    ),
    LineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartTemperature,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Temperature',
    ),
    SplineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartTemperature,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Temperature',
    )
  ];
  static List<dynamic> humidityListWidget = [
    ColumnSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartHumidity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Humidity',
    ),
    LineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartHumidity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Humidity',
    ),
    SplineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartHumidity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Humidity',
    )
  ];
  static List<dynamic> pressureListWidget = [
    ColumnSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartPressure,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Pressure',
    ),
    LineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartPressure,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Pressure',
    ),
    SplineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartPressure,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Pressure',
    )
  ];
  static List<dynamic> luminosityListWidget = [
    ColumnSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartLuminosity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Luminosity',
    ),
    LineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartLuminosity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Luminosity',
    ),
    SplineSeries<ChartSampleData, DateTime>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartLuminosity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Luminosity',
    )
  ];

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
  String dropdownValue = ChartSampleData.list.first;
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
    _tooltipBehaviorTemperature = TooltipBehavior(enable: true);
    _tooltipBehaviorLuminosity = TooltipBehavior(enable: true);
    _tooltipBehaviorPressure = TooltipBehavior(enable: true);
    _tooltipBehaviorHumidity = TooltipBehavior(enable: true);
    _zoomPanBehaviorTemperature = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);
    _zoomPanBehaviorLuminosity = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);
    _zoomPanBehaviorPressure = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);
    _zoomPanBehaviorHumidity = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);
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
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: ChartSampleData.list
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Title(color: Colors.black, child: Text("Temperature")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        backgroundColor: Colors.white,
                        tooltipBehavior: _tooltipBehaviorTemperature,
                        zoomPanBehavior: _zoomPanBehaviorTemperature,

                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          ChartSampleData.temperatureListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)]
                        ])),
                Title(color: Colors.black, child: Text("Humidity")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehaviorHumidity,
                        zoomPanBehavior: _zoomPanBehaviorHumidity,
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          ChartSampleData.humidityListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)]
                        ])),
                Title(color: Colors.black, child: Text("Pressure")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehaviorPressure,
                        zoomPanBehavior: _zoomPanBehaviorPressure,
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          ChartSampleData.pressureListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)]
                        ])),
                Title(color: Colors.black, child: Text("Luminosity")),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehaviorLuminosity,
                        zoomPanBehavior: _zoomPanBehaviorLuminosity,
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis: DateTimeAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            intervalType: DateTimeIntervalType.hours),
                        series: <ChartSeries<ChartSampleData, DateTime>>[
                          ChartSampleData.luminosityListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)]
                        ])),
              ],
            ),
          ),
        ));
  }
}
