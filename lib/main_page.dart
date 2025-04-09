import 'package:flutter/material.dart';
import 'data/location_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  double _lat = 0.0;
  double _long = 0.0;
  String locationName = '';

  double get currentLat => _lat;
  double get currentLong => _long;

  Future<void> updateLocation() async {
    try {
      final locationInfo = await LocationData().getCurrentLocation();
      final locationNameInfo = await LocationData().getLocationName();
      setState(() {
        _lat = locationInfo.latitude;
        _long = locationInfo.longitude;
        locationName = locationNameInfo;
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.location_on),
              onPressed: () {updateLocation();
              },
            ),
      
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
