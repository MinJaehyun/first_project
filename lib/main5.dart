import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '14~15',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('AppBar Icon Menu'),
        centerTitle: true,
        // leading: Icon(Icons.menu),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              print('menu btn is clicked');
            },
        ),
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {
            print('shopping_cart btn is clicked');
          }, icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {
            print('shopping_cart btn is clicked');
          }, icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}
