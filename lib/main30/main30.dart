import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../main30/sign/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 23.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
