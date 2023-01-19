import 'package:geolocator/geolocator.dart';

class Loading {
  double? longitude2;
  double? latitude2;

  Future<void> getGeoLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude2 = position.longitude;
      latitude2 = position.latitude;
    } catch (e) {
      print('internet connection err');
    }
  }
}
