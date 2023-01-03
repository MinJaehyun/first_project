import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String weatherApiKey = dotenv.get('WEATHER_APIKEY');
  double? latitude2;
  double? longitude2;
  dynamic jsonData;
  String? cityName;
  int? temperature;
  DateTime? now;
  String? formatDate3;
  String? day;
  String? ymd;

  @override
  void initState() {
    super.initState();
    all();
  }

  // initState 에서 async 처리 안되므로 함수안에서 aysnc 처리되도록 설정함
  Future<void> all() async {
    await getLocation();
    await fetchData();
  }

  // 위도,경도 가져오기
  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude2 = position.latitude;
    longitude2 = position.longitude;
    // print('1: $latitude2');
  }

  // fetchData
  Future<void> fetchData() async {
    // 서버에서 데이터 가져오려면 ? http 패키지 설정하기
    // var url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    // var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$weatherApiKey');
    // print('2: $latitude2');
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$weatherApiKey&units=metric'));
    // print();
    if (response.statusCode == 200) {
      // response.body 는 jsonData, jsonDecode 처리된 jsonData는 obj
      jsonData = jsonDecode(response.body);
      // print(jsonData);
    } else {
      throw Exception('Failed to load weather');
    }

    setState(() {
      cityName = jsonData['name'];
      temperature = jsonData['main']['temp'].round();

      // 시간 설정
      now = DateTime.now(); //  2023-01-03 17:03:11.107009
      // String formatDate = DateFormat('yy/MM/dd - HH:mm:ss').format(now!); // 23/01/03 - 17:02:46
      // String formatDate2 = DateFormat('HH:mm').format(now!);
      formatDate3 = DateFormat.jm().format(now!);

      // 요일 설정
      ymd = DateFormat.yMMMMd('en_US').format(now!); // Tue, 1/3/2023
      day = DateFormat('EEEE').format(now!); // Tuesday
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('Weather'),
        centerTitle: true,
        leading: const Icon(Icons.home),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_balance)),
        ],
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.orange[300],
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              '$cityName',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(height: 25),
            // TODO: 조건에 따른 날씨를 SVG로 나타내기

            // 온도: unicode \U+2103을 flutter에서는 소문자로 +제거하고 사용함
            Text(
              '$temperature\u2103',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            // 날짜
            const SizedBox(height: 155),
            Text(
              '$day',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            // 요일
            const SizedBox(height: 5),
            Text(
              '$ymd',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            // 시간
            const SizedBox(height: 15),
            Text(
              '$formatDate3',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
