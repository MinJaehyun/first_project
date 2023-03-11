import 'package:first_project/4.layout/2/my_icon.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PULDA',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          backgroundColor: Colors.amber[800],
          centerTitle: true,
          title: const Text('PULDA'),
        ),
        body: const ContextBody(),
        bottomNavigationBar: BottomAppBar());
  }
}

class ContextBody extends StatelessWidget {
  const ContextBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage('assets/main4/camera1.jpg'),
                radius: 45.0,
                backgroundColor: Colors.amber[200],
              ),
              Row(
                children: [
                  Text('NAME: ',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  const SizedBox(height: 10),
                  const Text(
                    'Min JH',
                    style: TextStyle(
                        color: Colors.white, fontSize: 25, letterSpacing: 1.5),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            height: 60,
            // indent: 0,
            endIndent: 10,
            thickness: 2,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              MyIcon(text: 'using lightsaber'),
              SizedBox(width: 10.0),
              MyIcon(text: 'hero face tattoo'),
              SizedBox(width: 10.0),
              MyIcon(text: 'fire flames'),
            ],
          ),
        ],
      ),
    );
  }

  void iconText() {}
}
