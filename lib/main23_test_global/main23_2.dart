import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final myKey = GlobalKey<_CountState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Count(
          key: myKey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // note: countAdd 함수 실행
          myKey.currentState?.countAdd();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 0;

  void countAdd() {
    setState(
      () {
        count += 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text('data: $count');
  }
}
