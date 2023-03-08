import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                }, child: const Text('Go to the ScreenB')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/c');
                }, child: const Text('Go to the ScreenC')),
          ],
        ),
      ),
    );
  }
}
