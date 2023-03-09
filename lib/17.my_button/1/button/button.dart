import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  const MyButtons(
      {Key? key,
      required this.image,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.radius})
      : super(key: key);
  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color, // color: Colors.blue[900],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          text,
          Opacity(opacity: 0.0, child: Image.asset('assets/main17/flogo.png')),
        ],
      ),
    );
  }
}
