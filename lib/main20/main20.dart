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
  String bottomData = '버튼을 사용하지 않고, 데이터를 읽어 오는 중입니다';

  var style = const TextStyle(fontSize: 22, color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  fetchData();
                },
                child: const Text('Future btn')),
            const SizedBox(height: 22),
            Text(
              currentData,
              style: style,
              // style: ,
            ),
            const Divider(
              height: 20,
              thickness: 3.5,
            ),
            FutureBuilder(
              future: myData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data!);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    children: [
                      Text(bottomData),
                      const CircularProgressIndicator(),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void fetchData() async {
    // 글자 변경 후, 색상이 변경되도록 Future이벤트를 동기적으로 설정
    Duration duration = const Duration(seconds: 2);
    // 방법 1. Future.delayed()
    // await Future.delayed(duration, () {
    //   setState(() {
    //     currentData = 'The data is fetched';
    //   });
    // });

    // 방법 2. Future실행 성공 후, .then 이하 코드 실행하는 방법
    await Future.delayed(duration).then((val) {
      setState(() {
        currentData = 'The data is fetched';
      });
    });
    setState(() {
      style = const TextStyle(fontSize: 22, color: Colors.green);
    });
  }

  Future<String> myData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'The data is fetched';
  }
}
