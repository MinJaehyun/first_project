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
        // appBar
        // appBar: AppBar(title: Text('앱 제목')),


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
        // body: Container(
        //     width: double.infinity, height: 50, color: Colors.lightBlue,
        // ),

        // NOTE: string design - TextStyle
        // body: SizedBox(
        //   child: Text(
        //     '중단 내용',
        //     style: TextStyle(
        //       color: Colors.blue, fontSize: 30,
        //       letterSpacing: 5, backgroundColor: Colors.red,
        //       fontWeight: FontWeight.w700,
        //     ),
        //   ),
        //   // child: Text('중단 내용', style: TextStyle(color: Color(0xffaaaaaa))),
        // ),

        // NOTE: button
        // body: SizedBox(
        //   child: ElevatedButton(
        //     child: Text('test'),
        //     onPressed: (){},
        //     style: ButtonStyle(),
        //   ),
        // ),

        // NOTE: button
        // body: SizedBox(
        //   child: IconButton(
        //     icon: Icon(Icons.star),
        //     onPressed: (){},
        //     style: ButtonStyle(),
        //   ),
        // ),

        // AppBar design - icon, text
        // appBar: AppBar(leading: Icon(Icons.star), title: Text('앱 제목'), actions: [Icon(Icons.start), Icon(Icons.start)],),

        // test
        appBar: AppBar(
          // TODO: DropdownButton 만들기 (나중)
          // TODO: 각 icon 공백 넣기
          title: Text('화성시'), actions: [Icon(Icons.search), Icon(Icons.menu), Icon(Icons.add_alert)]),


        body: Container(
          // NOTE: lp 박스 너비 설정
          // width: double.infinity, height: 300, color: Colors.cyan,
          // child: Row(
          //   children: [
          //     Container(width: 55, height: 55, color: Colors.blue),
          //     Container(width: 111, height: 111, color: Colors.red),
          //   ],
          // ),

          // NOTE: % 박스 너비 설정
          // child: Row(
          //   children: [
          //     Flexible(child: Container(
          //       color: Colors.blueGrey,
          //     ), flex: 3),
          //     Flexible(child: Container(
          //       color: Colors.red,
          //     ), flex: 7),
          //   ],
          // ),

          // NOTE: 상품 설명서
          height: 150, // NOTE: 아래 카메라 높이는 이곳에서 설정하여 해결
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset('camera1.jpg', width: 300),
              Flexible(child: Container(
                // width: 300,
                child: Column(
                  // NOTE: Column 에서 X축 정렬하는 방법
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함', style: TextStyle(fontWeight: FontWeight.w800)),
                    Text('기배로, 10분 전'),
                    Text('76만원'),
                    Row(
                      // NOTE: Row 에서 X축 정렬하는 방법
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite),
                          Text('4'),
                        ]),
                  ],
                ),
              ),flex: 1,)
            ],
          ),
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
