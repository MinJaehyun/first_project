import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Position? position;
  var myJson;

  Future<void> geoLocation() async {
    // todo: 추 후 helper/network.dart 로 분리하기
    try {
      await Geolocator.requestPermission();
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      debugPrint('internet connection err');
    }
  }

  // todo: 추 후 helper/api_fetchData.dart 로 분리하기
  Future<void> fetchData() async {
    var url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    http.Response? response = await http.get(url);
    var jsonData = response.body;
    setState(() {
      myJson = jsonDecode(jsonData)['weather'][0];
      // {id: 300, main: Drizzle, description: light intensity drizzle, icon: 09d}
    });
  }

  @override
  void initState() {
    super.initState();
    geoLocation();
  }

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 25);
    return Scaffold(
      appBar: AppBar(title: const Text('MyPage'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('앱 실행 시, 위도와 경도 나타내기', style: TextStyle(fontSize: 25)),
              if (position != null) Text(position!.toString(), style: const TextStyle(fontSize: 35)),
              const Divider(height: 20, thickness: 3),
              Text(' 지역 날씨 정보', style: TextStyle(fontSize: 25)),
              ElevatedButton(
                onPressed: () {
                  fetchData();
                },
                child: const Text('날씨 정보 가져오기'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (myJson != null) Text('id: ${myJson['id'].toString()}', style: style),
                  if (myJson != null) Text('main: $myJson["main"]', style: style),
                  if (myJson != null) Text('description: $myJson["description"]', style: style),
                  if (myJson != null) Text('iconNumber: $myJson["icon"]', style: style),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
