import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/loginPage.dart';
import 'package:flutter_application_1/src/models/humidity_model.dart';
import 'package:flutter_application_1/src/service/meteo_service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_application_1/src/display.dart';

class MyMapPage extends StatefulWidget {
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
                point: LatLng(currentPosition.latitude + 0.0001,
                    currentPosition.longitude + 0.0001),
                builder: (ctx) => InkWell(
                  child: Container(
                    child: Icon(Icons.sunny_snowing),
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
                  onTap: () {
                    var humidity = MeteoService().getHumidity();
                    print(humidity);
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
                                    "Longitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}Longitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}Longitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}"),
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
