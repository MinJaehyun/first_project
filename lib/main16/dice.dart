import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Page'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(22),
        child: const Text('Dice page',style: TextStyle(fontSize: 32),),
      ),
    );
  }
}
