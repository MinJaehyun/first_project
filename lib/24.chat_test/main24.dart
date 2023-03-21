import 'package:first_project/24.chat_test/screen/chat/chat_screen.dart';
import 'package:first_project/24.chat_test/screen/signin_signup/signin_signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "${dotenv.env['FIREBASE_APIKEY']}",
      appId: "com.example.first_project",
      messagingSenderId: "messagingSenderId",
      projectId: "chats-app-5b904",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // note: ★ StreamBuilder 에서 authStateChanges 으로 토큰유무 체크하고 진행하는게 특징
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const ChatScreen();
          }
          return const SigninSignup();
        }),
      ),
    );
  }
}
