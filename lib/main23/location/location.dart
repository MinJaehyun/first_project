import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude2;
  double? longitude2;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude2 = position.latitude;
    longitude2 = position.longitude;
  }
}