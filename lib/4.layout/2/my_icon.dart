import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  MyIcon({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: Colors.blueGrey),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: Colors.blueGrey),
        ),
      ],
    );
  }
}
