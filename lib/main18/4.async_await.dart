import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showData();
    return MaterialApp(
      home: Scaffold(
        body: Text(
          '4.async_await',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

void showData() async {
  startTask();
  int account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '시작';
  print(info1);
}

Future<int> accessData() async {
  int account = 0;
  Duration time = const Duration(seconds: 10);
  await Future.delayed(time, () {
    account = 8500;
    print(account);
  });

  return account;
}

void fetchData(int account) {
  String info3 = '잔액은 $account만원 입니다.';
  print(info3);
}
