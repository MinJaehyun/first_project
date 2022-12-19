import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '19-2.Toast Msg',
      debugShowCheckedModeBanner: false,
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
        title: const Text('Toast Message'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 클릭 시, 하단 팝업 띄우기
            flutterToast();
          },
          child: const Text('Toast Btn'),
        ),
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
    msg: "This is Center Short Toast",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.teal,
    textColor: Colors.white,
    fontSize: 18.0,
  );
}
