import 'package:geolocator/geolocator.dart';

class GetLocation {
  late double latitude2, longitude2;
  // note: 위도, 경도를 활용하기 위한 함수
  Future<dynamic> getLocation() async {
    // note: 위도, 경도 가져오기
    await Geolocator.requestPermission();
    // note: await Geolocator.checkPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude2 = position.latitude;
    longitude2 = position.longitude;
    return position;
  }
}