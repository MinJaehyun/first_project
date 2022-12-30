import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'lotto_list',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<int> numList = [];
  List<int> myList = [];
  int matchCount = 0;
  List<int> matchNumber = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lotto_list'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  '당첨번호:',
                  style: TextStyle(fontSize: 40),
                ),
                Text(numList.toString(), style: const TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                const Text(
                  '내 추첨번호',
                  style: TextStyle(fontSize: 40),
                ),
                Text(myList.toString(), style: const TextStyle(fontSize: 20))
              ],
            ),
            const SizedBox(height: 25),
            Text('$matchCount개의 당첨번호가 있습니다.',
                style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  randomLotto();
                  myLotto();
                  matchCountFunc(numList, myList);
                  // toast msg
                  if(matchNumber.isNotEmpty) flutterToast(matchNumber);

                  // test snack bar
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('당첨번호는 $matchNumber 입니다'),
                  //       backgroundColor: Colors.indigo,
                  //     ));
                },
                child: const Text('당첨번호 돌리기'))
          ],
        ),
      ),
    );
  }

  // 당첨 로또번호
  List<int> randomLotto() {
    // 버튼 클릭 시, 기존값 초기화하여 새로 번호 만들기
    numList = [];
    // setState 사용하여 변수값 변경
    setState(() {
      // List.generate 사용하여 중복되지 않는 숫자 생성
      numList = (List.generate(45, (i) => i+1)..shuffle()).sublist(0,6);
      // print(test);
    });
    return numList;
  }

  // 내 로또번호
  List<int> myLotto() {
    myList = [];
    setState(() {
      myList = (List.generate(45, (i) => i+1)..shuffle()).sublist(0,6);
    });
    return myList;
  }

  // 동일한 번호 찾기
  void matchCountFunc(numList, myList) {
    matchCount = 0;
    matchNumber = [];
    for (int i in numList) {
      for (int j in myList) {
        if (i == j) {
          matchCount++;
          matchNumber.add(i);
          if (kDebugMode) print(i);
        }
      }
    }
  }

  // toast msg setup
  void flutterToast(List<int> numList) {
    Fluttertoast.showToast(
        msg: "당첨번호는 $numList 입니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
