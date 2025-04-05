import 'package:flutter/material.dart';

import 'location_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  String locationData = "";
  double lat = 0.0;
  double long = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final locationInfo = await LocationData().getCurrentLocation();
                setState(() {
                  locationData = locationInfo['locationData'] ?? 'Unknown';
                  lat = locationInfo['lat'] ?? 0.0;
                  long = locationInfo['long'] ?? 0.0;
                });
                            },
              child: const Text("Get Location"),
            ),
            Text("Location: $locationData"),
            Text("Latitude: $lat"),
            Text("Longitude: $long"),
          ],
        ),
      ),
    );
  }
}
