import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.cyan,
      body: Container(
        color: Colors.redAccent,
        // margin: EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        padding: const EdgeInsets.all(20),
        child: const Text('container color and backgroundColor',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
