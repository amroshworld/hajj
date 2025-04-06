import 'package:flutter/material.dart';
import 'data/location_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  double lat =0.0;
  double long = 0.0;
  String locationName = '';

  

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.location_on),
              onPressed: () async {
                try {
                  final locationInfo =
                      await LocationData().getCurrentLocation();
                  final locationNameInfo = await LocationData().getLocationName(
                    lat,
                    long,
                  );
                  setState(() {
                    lat = locationInfo.latitude;
                    long = locationInfo.longitude;
                    locationName = locationNameInfo;
                  });
                } catch (e) {
                  print("Error getting location: $e");
                }
              },
            ),
            Text("Latitude: $lat", style: const TextStyle(fontSize: 16)),
            Text("Longitude: $long", style: const TextStyle(fontSize: 16)),
            Text(
              "Location Name: $locationName",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
