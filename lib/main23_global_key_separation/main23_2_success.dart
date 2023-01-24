import 'package:first_project/main23_global_key_separation/count_number/count_number.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  MyPage({Key? key}) : super(key: key);
  final myKey = GlobalKey<CountState>();
  // note: 위젯을 파일로 나눴을 때, GlobalKey<_HomePageState> globalKey=GlobalKey()에서 _ (언더바) 사용하면 참조 못 한다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Count(
          key: myKey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // note: countAdd 함수 실행
          myKey.currentState?.countAdd();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
