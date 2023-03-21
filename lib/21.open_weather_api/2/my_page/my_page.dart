import 'package:first_project/21.open_weather_api/2/geolocation/geolocation.dart';
import 'package:first_project/21.open_weather_api/2/model/air_pollution.dart';
import 'package:first_project/21.open_weather_api/2/model/weather_svg.dart';
import 'package:first_project/21.open_weather_api/2/network/network.dart';
import 'package:first_project/21.open_weather_api/2/body/body.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String apiKey = dotenv.get('API_KEY');
  late double latitude3, longitude3, temperature, particulateMatter, ultraParticulateMatter;
  late Widget indexImg, indexText;
  late SvgPicture loadSvg;

  Future<void> getWeather() async {
    try {
      GetLocation getLocation = GetLocation();
      await getLocation.getLocation();
      // getter: 위도와 경도 설정
      latitude3 = getLocation.latitude;
      longitude3 = getLocation.longitude;

      String url = "https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric";
      Network getJsonData = Network(url);
      var weatherOjb = await getJsonData.getJsonData();
      temperature = weatherOjb['main']['temp'];
      int conditionId = weatherOjb['weather'][0]['id'];
      // model/weather_svg 날씨 정보를 이미지로 반환
      Weather_Model weatherModel = Weather_Model(conditionId);
      loadSvg = weatherModel.getSvg();
    } catch (e) {
      debugPrint('getWeather err');
    }
  }

  Future<void> getAirPollution() async {
    try {
      String airUrl = "http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apiKey";

      Network getJsonData = Network(airUrl);
      var airPollutionOjb = await getJsonData.getJsonData();
      int index = airPollutionOjb['list'][0]['main']['aqi'];
      particulateMatter = airPollutionOjb['list'][0]['components']['pm10'];
      ultraParticulateMatter = airPollutionOjb['list'][0]['components']['pm2_5'];

      AirPollution airPollution = AirPollution(index);
      indexImg = airPollution.getAqiImg();
      indexText = airPollution.getAqiText();
    } catch (e) {
      debugPrint('getAirPollution err');
    }
  }

  void getFunc() async {
    await getWeather();
    await getAirPollution();
  }

  @override
  void initState() {
    super.initState();
    getFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          // 지역 찾기
          onPressed: () {},
          icon: const Icon(Icons.near_me),
        ),
        actions: [
          // 현재 위치 찾기
          IconButton(onPressed: () {}, icon: const Icon(Icons.my_location)),
        ],
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 10)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Column(
              children: [
                SizedBox(height: 330),
                Text('날씨 앱을 초기화 중입니다', style: TextStyle(fontSize: 25)),
                SizedBox(height: 30),
                CircularProgressIndicator(),
              ],
            ));
          }
          return DustBody(
            loadSvg: loadSvg,
            temperature: temperature,
            indexImg: indexImg,
            indexText: indexText,
            particulateMatter: particulateMatter,
            ultraParticulateMatter: ultraParticulateMatter,
          );
        },
      ),
    );
  }
}
