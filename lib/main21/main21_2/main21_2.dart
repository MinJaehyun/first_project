import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '21-2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.orange),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late double latitude2, longitude2;
  late String url;
  String apiKey = dotenv.get('API_KEY');

  // note: 위도, 경도를 활용하기 위한 함수
  Future<dynamic> getLocation() async {
    // note: 위도, 경도 가져오기
    await Geolocator.requestPermission();
    // note: await Geolocator.checkPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude2 = position.latitude;
    longitude2 = position.longitude;

    // note: 날씨정보 가져오기
    url = "https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$apiKey";

    // note: url을 구문분석해야 http.get에서 사용할 수 있다
    var response = await http.get(Uri.parse(url));

    // note: response만 찍으면 Instance뜬다
    print(response.body);

    // note: json to obj
    var jsonDecodeData = jsonDecode(response.body);
    print(jsonDecodeData['weather'][0]['main']);

    return position;
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          // note: https://material.io/tools/icons
          icon: const Icon(Icons.near_me),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.my_location)),
        ],
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
