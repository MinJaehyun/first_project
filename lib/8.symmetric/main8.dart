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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.redAccent,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              padding: const EdgeInsets.all(20),
              child: const Text('container color and backgroundColor',
                  style: TextStyle(color: Colors.white)),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Text('container1'),
              width: 100,
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('container2'),
              width: 100,
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.red),
              child: Text('container3'),
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
