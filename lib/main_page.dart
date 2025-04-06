import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data/location_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  double? lat;
  double? long;
  dynamic weatherdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.locationDot),
              onPressed: () async {
                final locationInfo = await LocationData().getCurrentLocation();

                setState(() {
                  lat = locationInfo.latitude;
                  long = locationInfo.longitude;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
