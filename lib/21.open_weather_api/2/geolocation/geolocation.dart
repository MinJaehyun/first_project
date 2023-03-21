import 'package:geolocator/geolocator.dart';

// note: 위도, 경도 받기 위한 clss
class GetLocation {
  late Position position;

  Future<dynamic> getLocation() async {
    await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  // getter
  double get latitude {
    return position.latitude;
  }

  double get longitude {
    return position.longitude;
  }
}
