import 'package:flutter/material.dart';
import 'main10/screen_a.dart';
import 'main10/screen_b.dart';
import 'main10/screen_c.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '10',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      // home: const MyPage(),
      // home: const ScreenA(),
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenA(),
        '/b': (context) => const ScreenB(),
        '/c': (context) => const ScreenC(),
      },
    );
  }
}
