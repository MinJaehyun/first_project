import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  // NOTE: 방법 1.
  const WeatherPage({Key? key, required this.parsingData}) : super(key: key);
  final dynamic parsingData;

  // NOTE: 방법 2.
  // WeatherPage({this.parsingData});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double? temp;
  String? cityName;

  @override
  void initState() {
    super.initState();
    // print('widget.parseingData: ${widget.parsingData}');
    updateData(widget.parsingData);
  }

  void updateData(dynamic weatherData) {
      temp = weatherData['main']['temp'];
      cityName = weatherData['name']!;
      print(cityName);
      print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$cityName', style: const TextStyle(fontSize: 22),),
            const SizedBox(height: 15,),
            Text('${temp?.round()}', style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
