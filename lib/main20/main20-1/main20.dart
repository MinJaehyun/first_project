import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Future test',
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
  String currentData = 'no data found';
  TextStyle style = const TextStyle(fontSize: 26, color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Test'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentData, style: style),
            const SizedBox(height: 22),
            // note: 버튼 클릭하여 데이터 가져와서 변경
            ElevatedButton(onPressed: () => fetchData(), child: const Text('데이터 가져오기')),
            const Divider(height: 20, thickness: 3.5, indent: 55, endIndent: 55),
            const SizedBox(height: 22),

            // note: 실시간 데이터 가져와 변경
            FutureBuilder(
              // note: future 에는 done 에서 사용할 마지막 출력할 값을 설정한다
              future: myData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [Text(snapshot.data.toString(), style: TextStyle(fontSize: 25))]);
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    Duration duration = const Duration(seconds: 2);
    // 방법 1. Future.delayed() 의 두 번째 인자인 함수를 활용하는 방법
    // note: factory Future.delayed(Duration duration, [FutureOr<T> computation()?]) {
    // await Future.delayed(duration, () {
    //   setState(() {
    //     currentData = 'The data is fetched';
    //   });
    // });

    // 방법 2. Future 실행 후, .then 으로 결과 받는 방법
    await Future.delayed(duration).then((val) {
      setState(() {
        currentData = '버튼을 사용하여\n데이터를 가져 왔습니다';
      });
    });
  }

  Future<String> myData() async {
    Duration duration = const Duration(seconds: 4);
    await Future.delayed(duration);
    return '버튼을 사용하지 않고\n데이터를 가져 왔습니다';
  }
}
