import 'package:flutter/material.dart';
import 'package:first_project/main21/main21_2/air_pollution/air_pollution.dart';
import 'package:first_project/main21/main21_2/weather_svg/weather_svg.dart';
import 'package:first_project/main21/main21_2/geolocation/geolocation.dart';
import 'package:first_project/main21/main21_2/network/network.dart';
import 'package:first_project/main21/main21_2/body/body.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String apiKey = dotenv.get('API_KEY');
  late double latitude3,
      longitude3,
      temperature,
      particulateMatter,
      ultraParticulateMatter;
  late SvgPicture loadSvg;
  late Widget indexImg, indexText;

  Future<void> getWeather() async {
    try {
      GetLocation getLocation = GetLocation();
      await getLocation.getLocation();
      // latitude3 = getLocation.latitude2;
      // longitude3 = getLocation.longitude2;

      // getter
      latitude3 = getLocation.latitude;
      longitude3 = getLocation.longitude;

      String url = "https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric";

      Network getJsonData = Network(url);
      var weatherOjb = await getJsonData.getJsonData();
      int conditionId = weatherOjb['weather'][0]['id'];
      temperature = weatherOjb['main']['temp'];

      Model model = Model(conditionId);
      loadSvg = model.getSvg();
      // print(loadSvg);
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
      ultraParticulateMatter =
          airPollutionOjb['list'][0]['components']['pm2_5'];

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
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.near_me),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.my_location)),
          ],
        ),
        body: DustBody(
          loadSvg: loadSvg,
          temperature: temperature,
          indexImg: indexImg,
          indexText: indexText,
          particulateMatter: particulateMatter,
          ultraParticulateMatter: ultraParticulateMatter,
        ));
  }
}
