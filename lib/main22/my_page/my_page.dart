import 'package:first_project/main22/loading/loading.dart';
import 'package:flutter/material.dart';
import '../network/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../weather_page/weather_page.dart';

String apiKey = dotenv.get('WEATHER_APIKEY');

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  double? longitude3;
  double? latitude3;

  void geoLocation() async {
    Loading myLocation = Loading();
    await myLocation.getGeoLocation();
    longitude3 = myLocation.longitude2;
    latitude3 = myLocation.latitude2;

    // fetchData
    Network parsingData = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');
    var weatherData = await parsingData.fetchData();
    // print('weatherData: $weatherData');

    // Do not use BuildContexts across async gaps
    if (!mounted) return;
    // 앱 실행 시, 날씨 페이지로 이동
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => WeatherPage(parsingData: weatherData)));
  }

  @override
  void initState() {
    super.initState();
    geoLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPage'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
