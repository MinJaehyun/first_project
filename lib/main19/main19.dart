import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  Set<int> numList = {};
  Set<int> myList = {};
  int matchCount = 0;

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
                },
                child: const Text('당첨번호 돌리기'))
          ],
        ),
      ),
    );
  }

  // 당첨 로또번호
  Set<int> randomLotto() {
    setState(() {
      while (numList.length != 6) {
        numList.add(Random().nextInt(45) + 1);
      }
    });
    return numList;
  }

  // 내 로또번호
  Set<int> myLotto() {
    setState(() {
      while (myList.length != 6) {
        myList.add(Random().nextInt(45) + 1);
      }
    });
    return myList;
  }

  // 동일한 번호 찾기
  void matchCountFunc(numList, myList) {
    for (int i in numList) {
      for (int j in myList) {
        if (i == j) {
          matchCount++;
          if (kDebugMode) print(i);
        }
      }
    }
  }
}
