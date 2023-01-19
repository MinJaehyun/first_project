import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../main21_2/my_page/my_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '21-2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.orange),
      home: const MyPage(),
    );
  }
}


