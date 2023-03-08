import 'package:first_project/9/9-3/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // note: 아래 이동한 페이지에서 메시지 나타낼 수 없는 이유는 ?
            // SecondPage()에서 return ScaffoldMessenger 했기 때문
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text('결제를 진행 중 입니다.')));
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            }));
          },
          child: Text('결제하시겠습니까?'),
        ),
      ),
    );
  }
}
