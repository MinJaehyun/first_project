import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    showData();
    return Text(
      '1.sync!',
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
  debugPrint(info1);
}

void accessData() {
  String info2 = '데이터 접속 중';
  debugPrint(info2);
}

void fetchData() {
  String info3 = '잔액은 8,500만원 입니다.';
  debugPrint(info3);
}
