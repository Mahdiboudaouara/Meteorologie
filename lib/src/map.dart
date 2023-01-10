import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/loginPage.dart';
import 'package:flutter_application_1/src/models/humidity_model.dart';
import 'package:flutter_application_1/src/models/luminosity_model.dart';
import 'package:flutter_application_1/src/service/logout_service.dart';
import 'package:flutter_application_1/src/service/meteo_service.dart';
import 'package:flutter_application_1/src/welcomePage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_application_1/src/display.dart';

class MyMapPage extends StatefulWidget {
  static List finalLuminosity = [];
  static List finalTemperature = [];
  static List finalPressure = [];
  static List finalHumidity = [];

  @override
  MyMapPageState createState() => MyMapPageState();
}

class MyMapPageState extends State<MyMapPage> {
  // Declare a MapController field named 'mapController'
  late MapController mapController;

  // Declare a Position field named 'currentPosition'
  // and initialize it to the default position (0, 0)
  Position currentPosition = Position(
      longitude: 30.891738,
      latitude: 10.1764236,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);
  Position tappedPosition = Position(
      longitude: 30.891738,
      latitude: 10.1764236,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);

  // This method asynchronously determines the current position of the device
  // using the Geolocator package and updates the 'currentPosition' field
  // with the new position.
  Future<void> updateCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      currentPosition = position;
      mapController.move(
          LatLng(currentPosition.latitude, currentPosition.longitude), 16.0);
    });
  }

  @override
  void initState() {
    // Initialize the map controller and update the current position
    mapController = MapController();
    updateCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff7892b),
        title: Text("My Map"),
        actions: [
          Row(
            children: [
              Text("Logout"),
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                tooltip: 'Logout',
                onPressed: () async {
                  // LogoutService().logout().then((value) {
                  //   if (value == true) {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => LoginPage()));
                  //   }
                  // });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ],
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: FlutterMap(
        // Assign the map controller to the Flutter Map widget
        mapController: mapController,
        options: MapOptions(
          // Center the map on the current position
          center: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 16.0,
          onTap: (tapPosition, point) => {
            tappedPosition = Position(
                longitude: point.longitude,
                latitude: point.latitude,
                timestamp: DateTime.now(),
                accuracy: 0,
                altitude: 0,
                heading: 0,
                speed: 0,
                speedAccuracy: 0),
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point:
                    LatLng(currentPosition.latitude, currentPosition.longitude),
                builder: (ctx) => InkWell(
                  child: Container(
                    child: Icon(Icons.account_circle),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(
                            "Longitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}"),
                      ),
                    );
                  },
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentPosition.latitude - 0.0001,
                    currentPosition.longitude - 0.0001),
                builder: (ctx) => InkWell(
                  child: Container(
                    child: Icon(Icons.sunny_snowing),
                  ),
                  onTap: () async {
                    Map<String, num?>? humidity =
                        await MeteoService().getHumidity();

                    Map<String, num?>? luminosity =
                        await MeteoService().getLuminosity();
                    // var precipitations = await MeteoService().getPrecipitations();
                    Map<String, num?>? pressure =
                        await MeteoService().getPressure();
                    Map<String, num?>? temperature =
                        await MeteoService().getTemperature();

                    List<String> humidity1 = humidity!.keys.toList();
                    List<String> luminosity1 = luminosity!.keys.toList();
                    List<String> pressure1 = pressure!.keys.toList();
                    List<String> temperature1 = temperature!.keys.toList();
                    //humidty
                    ////
                    humidity1.sort((a, b) {
                      //sorting in ascending order
                      return DateTime.parse(a).compareTo(DateTime.parse(b));
                    });
                    List<String> SortedHumidityList =
                        List.from(humidity1.reversed);

                    //luminosity
                    ////
                    luminosity1.sort((a, b) {
                      //sorting in ascending order
                      return DateTime.parse(a).compareTo(DateTime.parse(b));
                    });
                    List<String> SortedLuminosityList =
                        List.from(luminosity1.reversed);

                    //pressure
                    ////
                    pressure1.sort((a, b) {
                      //sorting in ascending order
                      return DateTime.parse(a).compareTo(DateTime.parse(b));
                    });
                    List<String> SortedPressureList =
                        List.from(pressure1.reversed);

                    //temperature
                    ////
                    temperature1.sort((a, b) {
                      //sorting in ascending order
                      return DateTime.parse(a).compareTo(DateTime.parse(b));
                    });
                    List<String> SortedTemperatureList =
                        List.from(temperature1.reversed);

                    //print
                    MyMapPage.finalLuminosity = [
                      SortedLuminosityList,
                      luminosity
                    ];
                    MyMapPage.finalHumidity = [SortedHumidityList, humidity];
                    MyMapPage.finalPressure = [SortedPressureList, pressure];
                    MyMapPage.finalTemperature = [
                      SortedTemperatureList,
                      temperature
                    ];
                    print(SortedLuminosityList[0]);
                    print(humidity[SortedHumidityList[0]]);

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Container(
                          height: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                    "Date: ${SortedLuminosityList[0]}\nLongitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}\nTemperature: ${temperature[SortedTemperatureList[0]]}\nHumidity: ${humidity[SortedHumidityList[0]]}\nLuminosity: ${luminosity[SortedLuminosityList[0]]}\nPressure: ${pressure[SortedPressureList[0]]}"),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 251, 180, 72)),
                                  ),
                                  onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Display())),
                                      },
                                  child: Text("Show more details"))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController.move(
              LatLng(currentPosition.latitude, currentPosition.longitude),
              16.0);
        },
        child: Icon(Icons.my_location),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) => AlertDialog(
      //         content: Text(
      //             "Longitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}"),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
