import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '22-단순 페이지 이동 방법',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to the Second page'),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => const Secondpage()));
          },
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}

class Secondpage extends StatelessWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to the First page'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
