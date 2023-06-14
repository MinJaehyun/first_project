import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: const BodyContext(),
          bottomNavigationBar: SizedBox(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
              ],
            ),
          ),
        ));
  }
}

class BodyContext extends StatelessWidget {
  const BodyContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          // 기본 user account
          Row(children: const [
            Icon(Icons.account_circle_rounded),
            Text('민재현')
          ]),
          // 커스텀 user account
          Row(
            children: const [
              Icon(Icons.account_circle_rounded, size: 55),
              Text(
                '민재현',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              )
            ],
          ),
        ],
      ),
    );
  }
}

/* BottomAppBar 사용하여 여백 설정해도 된다.

bottomNavigationBar: BottomAppBar(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page),
          ],
        ),
        // height: 0,
      ),
*/