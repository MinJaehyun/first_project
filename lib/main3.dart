import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: const BodyContext(),
          bottomNavigationBar: SizedBox(
            child: Row(
              children: const [
                Icon(Icons.phone), Icon(Icons.message), Icon(Icons.contact_page),
              ],
            ),
          ),
        )
    );
  }
}

class BodyContext extends StatelessWidget {
  const BodyContext({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container( // 전체 박스
      color: Colors.cyan,
      child: ListView(
        children: [
          Row(
            children: const [
              Icon(Icons.account_circle_rounded), Text('민재현')
            ],
          ),
          Row(
            children: const [
              Icon(Icons.account_circle_rounded), Text('민재현')
            ],
          ),
          Row(
            children: const [
              Icon(Icons.account_circle_rounded), Text('민재현')
            ],
          ),
        ],
      ),
    );
  }
}
