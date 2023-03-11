import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/17.my_button/1/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglePage extends StatefulWidget {
  GooglePage({
    Key? key,
  }) : super(key: key);

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login user info'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              // note: 로그아웃
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LogIn();
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('${snapshot.data!.photoURL}'),
                  Text('이름: ${snapshot.data!.displayName}',
                      style: TextStyle(fontSize: 25)),
                  Text('이메일: ${snapshot.data!.email}',
                      style: TextStyle(fontSize: 25)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
