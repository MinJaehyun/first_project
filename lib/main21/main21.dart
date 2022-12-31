import 'package:flutter/material.dart';
import 'package:first_project/main21/my_page/my_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '21',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}
