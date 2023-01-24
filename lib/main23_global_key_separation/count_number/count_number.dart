import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => CountState();
}

class CountState extends State<Count> {
  int count = 0;

  void countAdd() {
    setState(
      () {
        count += 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'data: $count',
      style: const TextStyle(fontSize: 35),
    );
  }
}
