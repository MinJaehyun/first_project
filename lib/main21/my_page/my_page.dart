import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // late Position position = '' as Position;
  Position? position;

  void geoLocation() async {
    await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  void initState() {
    super.initState();
    geoLocation();
  }

  @override
  Widget build(BuildContext context) {
    print('build start');
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              position.toString(),
              style: const TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
