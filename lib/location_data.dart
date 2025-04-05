import 'package:geolocator/geolocator.dart';

class LocationData {
  Future<Map<String, dynamic>> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    var locationData = await Geolocator.getCurrentPosition();
    double lat = locationData.latitude;
    double long = locationData.longitude;
    print("Latitude: $lat, Longitude: $long");
    return {"locationData": locationData, "lat": lat, "long": long};
  }
}


