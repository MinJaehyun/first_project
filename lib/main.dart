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

        // NOTE: 중단 아이콘들을 정렬하는 방법
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   // crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [Icon(Icons.star), Icon(Icons.star), Icon(Icons.star)],
        // ),

        // NOTE: Box design - 박스 생성 및 margin, padding 설정, 박스 안 글자 입력
        // body: Container(
        //   width: 250, height: 100, color: Colors.blue,
        //   margin: EdgeInsets.all(30),
        //   padding: EdgeInsets.fromLTRB(30, 10, 10, 30),
        //   child: Text('test'),
        // ),

        // NOTE: Box design - decoration 적용하는 방법
        // body: Container(
        //   width: 250, height: 100,
        //   margin: EdgeInsets.all(30),
        //   padding: EdgeInsets.fromLTRB(30, 10, 10, 30),
        //   child: Text('test'),
        //   decoration: BoxDecoration(
        //     // border, color, shape 등등
        //     color: Colors.blueGrey,
        //     border: Border.all(color: Colors.deepPurpleAccent)
        //   ),
        // ),

        // NOTE: Box design - 위치 조정 중앙
        // body: Center(
        //   child: Container(
        //     width: 50, height: 50, color: Colors.lightBlue,
        //   ),
        // ),

        // // NOTE: Box design - 위치 조정 우상단, 세밀한 위치조절은 margin 으로 설정하기
        // body: Align(
        //   alignment: Alignment.topRight,
        //   child: Container(
        //     width: 50, height: 50, color: Colors.lightBlue,
        //   ),
        // ),

        // NOTE: Box design - 박스 너비 최대 설정
        body: Container(
            width: double.infinity, height: 50, color: Colors.lightBlue,
          ),

        // NOTE: 박스 높낮이 설정하기 위해 Container() 로 감싸기
        bottomNavigationBar: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(Icons.phone),Icon(Icons.message),Icon(Icons.contact_page)],
          ),
        ),
      )
    );
  }
}
