import 'package:first_project/main24/screen/chat/chat_screen.dart';
import 'package:first_project/main24/screen/signin_signup/signin_signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
