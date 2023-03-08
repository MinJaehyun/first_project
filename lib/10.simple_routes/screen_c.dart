import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenC'),
      ),
      body: const Center(
        child: Text('page is ScreenC '),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}
