import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // late Position position = '' as Position;
  Position? position;
  Response? response;

  void geoLocation() async {
    try {
      await Geolocator.requestPermission();
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      debugPrint(position.toString());
    } catch (e) {
      debugPrint('internet connection err');
    }
  }

  Future<String?> fetchData() async {
    var url = Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    response = await http.get(url);
    String? jsonData = response?.body;
    var myJson = jsonDecode(jsonData!)['weather'][0];
    debugPrint(myJson);
    return myJson;
  }

  @override
  void initState() {
    super.initState();
    geoLocation();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build start');
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPage'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                position.toString(),
                style: const TextStyle(fontSize: 35),
              ),
              const Divider(
                height: 20,
                thickness: 3,
              ),
              ElevatedButton(
                  onPressed: () {
                    fetchData();
                  },
                  child: const Text('http get')),
              Text(
                (response?.body).toString(),
                style: const TextStyle(fontSize: 35),
              ),
              const Divider(
                height: 20,
                thickness: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
