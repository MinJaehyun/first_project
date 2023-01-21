import 'package:first_project/main23/weather_page/weather_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        backgroundColor: Colors.orange[300],
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home UI',
            style: TextStyle(fontSize: 33, color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WeatherPage()));
            },
            child: const Text(
              '날씨정보 페이지로 이동하기',
            ),
          ),
        ],
      )),
    );
  }
}
