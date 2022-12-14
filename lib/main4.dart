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
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // NOTE: CircleAvatar
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/camera1.jpg'),
                radius: 60.0,
                backgroundColor: Colors.amber[200],
              ),
            ),
            // NOTE: 구분선
            const Divider(
              height: 60,
              indent: 50,
              endIndent: 50,
              thickness: 2.5,
            ),
            const Text('NAME', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            const Text('Min JH',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 50,
                    letterSpacing: 5)),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.check_circle_outline, color: Colors.blueGrey),
                    SizedBox(width: 10.0),
                    Text('using lightsaber',
                        style: TextStyle(color: Colors.blueGrey)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Icon(Icons.check_circle_outline, color: Colors.blueGrey),
                    SizedBox(width: 10.0),
                    Text('hero face tattoo',
                        style: TextStyle(color: Colors.blueGrey)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Icon(Icons.check_circle_outline, color: Colors.blueGrey),
                    SizedBox(width: 10.0),
                    Text('fire flames',
                        style: TextStyle(color: Colors.blueGrey)),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ));
  }
}
