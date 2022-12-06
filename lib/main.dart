import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text('안녕'),
      // home: Icon(Icons.zoom_in),
      home: Scaffold(
        appBar: AppBar(title: Text('앱 제목')),

        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Icon(Icons.star), Icon(Icons.star), Icon(Icons.star)],
        ),

        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.phone),Icon(Icons.message),Icon(Icons.contact_page)],
        ),
      )
    );
  }
}
