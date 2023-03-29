import 'package:first_project/27.provider/my_page.dart';
import 'package:first_project/27.provider/provider/fish_model.dart';
import 'package:first_project/27.provider/provider/meat_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FishModel(number: 7),
        ),
        ChangeNotifierProvider(
          create: (_) => MeatModel(number: 10),
        ),
      ],
      child: const MaterialApp(
        home: MyPage(),
      ),
    );
  }
}
