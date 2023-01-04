import 'package:first_project/main23/location/location.dart';
import 'package:first_project/main23/model/model.dart';
import 'package:first_project/main23/network/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String weatherApiKey = dotenv.get('WEATHER_APIKEY');
  double? latitude3, longitude3;
  dynamic jsonData;
  String? cityName, svgPath;
  int? temperature, weatherConditionId;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    all();
  }

  // initState 에서 async 처리 안되므로 함수안에서 async 처리되도록 설정함
  Future<void> all() async {
    await getLocation();
    await fetchData();
  }

  // // 위도,경도 가져오기
  Future<void> getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
  }

  // fetchData
  Future<void> fetchData() async {
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$weatherApiKey&units=metric');
    jsonData = await network.fetchData();
    // print(jsonData);

    setState(() {
      cityName = jsonData['name'];
      temperature = jsonData['main']['temp'].round();
      weatherConditionId = jsonData['weather'][0]['id'];
      // print(weatherConditionId);
    });

    Model icon = Model();
    svgPath = icon.getWeatherIcon(weatherConditionId!);
  }

  String? getDataTime() {
    return DateFormat.jm().format(now);
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('$svgPath'),
                const Text(
                  'sun',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),

            // 온도: unicode \U+2103을 flutter 는 소문자로 +제거하고 사용함
            Text(
              '$temperature\u2103',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            // 날짜
            const SizedBox(height: 155),
            Text(
              DateFormat('EEEE').format(now),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            // 요일
            const SizedBox(height: 5),
            Text(
              DateFormat.yMMMMd('en_US').format(now), // Tue, 1/3/2023,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            // 시간
            const SizedBox(height: 15),
            TimerBuilder.periodic(
              const Duration(minutes: 1),
              builder: (BuildContext context) {
                // print('');
                return Text(
                  '${getDataTime()}',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
