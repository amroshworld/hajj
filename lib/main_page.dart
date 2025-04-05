import 'package:flutter/material.dart';

import 'location_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  double? lat;
  double? long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final locationInfo = await LocationData().getCurrentLocation();
                setState(() {
                  lat = locationInfo['lat'];
                  long = locationInfo['long'];
                                    print("Latitude: $lat, Longitude: $long");
                  
                });
              },
              child: const Text("Get Location"),
            ),
            Text("Latitude: $lat"),
            Text("Longitude: $long"),
          ],
        ),
      ),
    );
  }
}
