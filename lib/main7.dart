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
        // backgroundColor: Colors.transparent,

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
      // showToast 의 내장 색상을 연한파란색으로 덮어씌우기
      webBgColor: "linear-gradient()",
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      // backgroundColor: Colors.blue, // TODO: ???
      textColor: Colors.white,
      fontSize: 30.0);
}
