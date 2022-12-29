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
  List<int> numList = [];
  List<int> myList = [];
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
                const Text('당첨번호:', style: TextStyle(fontSize: 40),),
                Text(numList.toString(),style: const TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                const Text('내 추첨번호', style: TextStyle(fontSize: 40),),
                Text(myList.toString(),style: const TextStyle(fontSize: 20))
              ],
            ),
            const SizedBox(height: 25),
            Text('$matchCount개의 당첨번호가 있습니다.',style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: (){
                  randomLotto();
                  myLotto();
                  matchCountFunc();
                },
                child: const Text('당첨번호 돌리기')
            )
          ],
        ),
      ),
    );
  }

  // 당첨 로또번호
  List<int> randomLotto() {
    setState((){
      while(numList.length < 7) {
        numList.add(Random().nextInt(45) + 1);
      }
    });
    return numList;
    // print(numList); //  List<int>
  }

  // 내 로또번호
  List<int> myLotto() {
    setState(() {
      while (myList.length < 7) {
        myList.add(Random().nextInt(45) + 1);
      }
    });
    return myList;
  }

  // 동일한 번호 찾기
  void matchCountFunc() {
    List<int> ranL = randomLotto();
    List<int> myL = myLotto();

    for (int i in ranL) {
      for (int j in myL) {
        if (i == j) {
          matchCount++;
          // print(matchCount);
          if (kDebugMode) {
            print(i);
          }
        }
      }
    }
  }

}
