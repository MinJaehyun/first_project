import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.image,
      required this.color,
      required this.radius,
      required this.loginText})
      : super(key: key);
  final Widget image;
  final Color color;
  final double radius;
  final Widget loginText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        // todo
        backgroundColor: color,
        // todo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // todo
          image,
          // todo
          loginText,
          Opacity(
            opacity: 0,
            child: Image.asset('assets/main17/glogo.png'),
          ),
        ],
      ),
    );
  }
}
