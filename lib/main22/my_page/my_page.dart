import 'package:first_project/main22/loading/loading.dart';
import 'package:flutter/material.dart';
import '../network/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey');
    var weatherData = await parsingData.fetchData();
    print(weatherData);
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
          child: Column(
            children: [
              Text(
                ('$longitude3'),
                style: const TextStyle(fontSize: 35),
              ),
              const Divider(
                height: 20,
                thickness: 3,
              ),
              ElevatedButton(
                  onPressed: () {
                    // fetchData();
                  },
                  child: const Text('http get')),
              Text(
                // (response?.body).toString(),
                ('test fetch'),
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
