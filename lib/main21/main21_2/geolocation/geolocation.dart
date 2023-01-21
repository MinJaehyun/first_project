import 'package:geolocator/geolocator.dart';

// note: 위도, 경도 받기 위한 함수
class GetLocation {
  // late double latitude2;
  // late double longitude2;
  late Position position;

  Future<dynamic> getLocation() async {
    await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // latitude2 = position.latitude;
    // longitude2 = position.longitude;
    return position;
  }
  double get latitude {
    return position.latitude;
  }
  double get longitude {
    return position.longitude;
  }
}