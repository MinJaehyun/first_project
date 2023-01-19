import 'package:first_project/main21/main21_2/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../geolocation/geolocation.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late double latitude3, longitude3;
  late String url;
  String apiKey = dotenv.get('API_KEY');

  Future<void> getGeolocation() async {
    GetLocation getLocation = GetLocation();
    // note: 아.. 함수까지 실행해야 함수안에 내용 변경된 내용 가져올 수 있다
    await getLocation.getLocation();
    latitude3 = getLocation.latitude2;
    longitude3 = getLocation.longitude2;

    url = "https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey";
    Network getJsonData = Network(url);
    var weatherOjb = await getJsonData.getJsonData();
    print(weatherOjb);
  }

  @override
  void initState() {
    super.initState();
    getGeolocation();
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