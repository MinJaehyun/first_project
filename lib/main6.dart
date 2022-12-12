import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '18',
      // NOTE: color: Colors.red(X), MaterialApp 내에서의 배경색은 theme 로 지정한다
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
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
        title: Text('Snack bar'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          // btn name
          child: Text('Btn'),
          // 클릭 시 text 출력
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Hello2')));
          },
        ),
      ),
    );
  }
}
