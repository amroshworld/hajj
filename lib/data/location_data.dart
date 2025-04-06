import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationData {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    try {
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

      Position locationData = await Geolocator.getCurrentPosition();

      return locationData;
    } catch (e) {
      return Future.error('Failed to get current location: $e');
    }
  }

  Future<String> getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String name =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
        print("Location Name: $name");
        return name;
      }
    } catch (e) {
      print("Error getting location name: $e");
    }
    return "Unknown Location";
  }
}
