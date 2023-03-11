import 'dart:math';
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
  Set<int> numSet = {};
  Set<int> mySet = {};
  int matchCount = 0;
  bool bonus = false;
  int bonusNum = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('번호 랜덤 생성'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('당첨번호 + 보너스번호(20)', style: TextStyle(fontSize: 30, color: Colors.redAccent)),
                !numSet.isEmpty
                    ? Text(numSet.toList().toString(),
                        style: const TextStyle(fontSize: 20))
                    : Opacity(opacity: 0)
              ],
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                const Text('내 추첨번호', style: TextStyle(fontSize: 30, color: Colors.redAccent)),
                !mySet.isEmpty
                    ? Text(mySet.toList().toString(),
                        style: const TextStyle(fontSize: 20))
                    : Opacity(opacity: 0)
              ],
            ),
            const SizedBox(height: 25),
            // note: 내 추첨번호에 20 있고 && 당첨개수가 1이상이면 Bonus 띄운다
            bonus && matchCount != 0
                ? Text('${matchCount.toString()} + bonus개의 당첨번호가 있습니다.',
                    style: const TextStyle(fontSize: 20, color: Colors.green))
                : Text('${matchCount.toString()}개의 당첨번호가 있습니다.',
                    style: const TextStyle(fontSize: 20, color: Colors.green)),
            ElevatedButton(
                onPressed: () async {
                  await randomLotto();
                  await myLotto();
                  matchCountFunc(numSet, mySet);
                },
                child: const Text('숫자 생성'))
          ],
        ),
      ),
    );
  }

  // 당첨번호
  Set<int> randomLotto() {
    setState(() {
      numSet = {};
      while (numSet.length != 6) {
        // note: 보너스 번호값인 20 은 포함되지 않는다
        int number = Random().nextInt(45) + 1;
        if (number != 20) {
          numSet.add(number);
        }
      }
      // note: List.generate 사용하여 중복되지 않는 숫자 생성하는 다른 방법
      // numList = (List.generate(45, (i) => i + 1)..shuffle()).sublist(0, 6);
    });

    return numSet;
  }

  // 내 추첨번호
  Set<int> myLotto() {
    setState(() {
      mySet = {};
      while (mySet.length != 6) {
        mySet.add(Random().nextInt(45) + 1);
      }
    });

    return mySet;
  }

  // 동일한 번호 찾기
  void matchCountFunc(numSet, mySet) {
    matchCount = 0;
    bonus = false;

    for (int i = 0; i < numSet.length; i++) {
      if (numSet.toList()[i] == mySet.toList()[i]) {
        matchCount++;
      }
    }
    for (int i in mySet) {
      if (i == bonusNum) {
        bonus = true;
      }
    }
  }
}
