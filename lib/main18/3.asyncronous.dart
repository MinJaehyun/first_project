import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showData();
    return Text(
      '3.sync',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

void showData() {
  startTask();
  accessData();
  fetchData();
}

void startTask() {
  String info1 = '시작';
  print(info1);
}

void accessData() {
  Duration time = const Duration(seconds: 10);
  // sleep(time);
  Future.delayed(time, () {
    String info2 = '데이터 접속 중';
    print(info2);
  });
}

void fetchData() {
  String info3 = '잔액은 8,500만원 입니다.';
  print(info3);
}
