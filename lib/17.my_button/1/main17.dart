import 'package:first_project/17.my_button/1/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env'); // 'assets/config/.env'
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "${dotenv.env['APIKEY']}",
    appId: "com.example.first_project",
    messagingSenderId: "Messaging sender id here",
    projectId: "chats-app-5b904",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogIn(),
    );
  }
}
