import 'package:first_project/main21/main21_2/air_pollution/air_pollution.dart';
import 'package:first_project/main21/main21_2/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../geolocation/geolocation.dart';
import '../weather_svg/weather_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late double latitude3, longitude3;
  late String url;
  String apiKey = dotenv.get('API_KEY');
  dynamic weatherOjb2;
  late int conditionId;
  late SvgPicture loadSvg2;
  late double temperature;
  late int index;
  late Widget indexImg;
  late Widget indexText;
  late double particulateMatter;
  late double ultraParticulateMatter;

  Future<void> getWeather() async {
    GetLocation getLocation = GetLocation();
    await getLocation.getLocation();
    latitude3 = getLocation.latitude2;
    longitude3 = getLocation.longitude2;

    url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric";
    print(url);
    Network getJsonData = Network(url);
    var weatherOjb = await getJsonData.getJsonData();
    weatherOjb2 = weatherOjb;
    conditionId = weatherOjb2['weather'][0]['id'];
    temperature = weatherOjb2['main']['temp'];
    // print(conditionId);

    // todo: Model 에 int 넘기기
    Model model = Model(conditionId);
    SvgPicture loadSvg = model.getSvg(conditionId);
    loadSvg2 = loadSvg;
  }

  String getTime() {
    var time = DateTime.now();
    return DateFormat(' EEEE \n d MMM, yyy \n\n hh:mm:ss a').format(time);
  }

  Future<void> getAirPollution() async {
    var airUrl = 'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apiKey';
    Network getJsonData = Network(airUrl);
    var airPollutionOjb = await getJsonData.getJsonData();
    // print(airPollutionOjb);
    index = airPollutionOjb['list'][0]['main']['aqi'];
    print(index);
    particulateMatter = airPollutionOjb['list'][0]['components']['pm10'];
    ultraParticulateMatter = airPollutionOjb['list'][0]['components']['pm2_5'];
    AirPollution airPollution = AirPollution(index);
    indexImg = airPollution.getAqiImg(index);
    indexText = airPollution.getAqiText(index);
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
          // note: https://material.io/tools/icons
          icon: const Icon(Icons.near_me),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.my_location)),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.orangeAccent,
        ),
        child: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 2),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    loadSvg2,
                    const SizedBox(height: 5),
                    Text(
                      '${temperature.round().toString()} \u2103',
                      style: GoogleFonts.getFont('Lato', fontSize: 25,color: Colors.white)
                    ),
                    const SizedBox(height: 70),
                    TimerBuilder.periodic(
                      const Duration(seconds: 1),
                      builder: (context) {
                        return Text(
                          getTime(),
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Divider(thickness: 1, color: Colors.white70),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('AQI(대기질 지수)', style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white)),
                              const SizedBox(height: 10),
                              // Image.asset('assets/main21/pollution_image/bad.png', width: 50),
                              indexImg,
                              const SizedBox(height: 10),
                              // Text("매우나쁨", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white)),
                              indexText,
                            ],
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            children: [
                              Text('미세먼지', style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white)),
                              const SizedBox(height: 10),
                              Text('$particulateMatter', style: GoogleFonts.getFont('Lato', fontSize: 38,color: Colors.white)),
                              const SizedBox(height: 10),
                              Text("㎍/㎥", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white)),
                            ],
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            children: [
                              Text('초미세먼지', style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white)),
                              const SizedBox(height: 10),
                              Text('$ultraParticulateMatter', style: GoogleFonts.getFont('Lato', fontSize: 38,color: Colors.white)),
                              const SizedBox(height: 10),
                              Text("㎍/㎥", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
