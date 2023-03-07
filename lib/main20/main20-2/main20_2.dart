import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FutureTest(),
    );
  }
}

class FutureTest extends StatefulWidget {
  const FutureTest({Key? key}) : super(key: key);

  @override
  State<FutureTest> createState() => _FutureTestState();
}

class _FutureTestState extends State<FutureTest> {
  String? fetchBtnData = 'no data found';
  String? fetchInitialData = '데이터를 로딩 중입니다';

  // note: (){}사용 시,
  Future<void> fetchFun() async {
    debugPrint('데이터 전송 시작');
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() => fetchBtnData = 'The data is fetched');
    });
    debugPrint('데이터 전송 종료');
  }

  // note: (){} 에서 return 받을 수 없다
  // Future<String> _lodingFutureData() async {
  //   await Future.delayed(const Duration(seconds: 2), () {
  //     return '데이터 로딩이 완료 되었습니다';
  //   },);
  // }

  // note: return 값이 있는 경우 형식
  Future<String> _lodingFutureData() async {
    await Future.delayed(const Duration(seconds: 2));
    return '데이터 로딩이 완료 되었습니다';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future test'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    fetchFun();
                  },
                  child: const Text('Future btn'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  // fetchData,
                  fetchBtnData!,
                  style: const TextStyle(fontSize: 35),
                ),
              ],
            ),
            const Divider(
              thickness: 5,
            ),
            FutureBuilder(
              initialData: fetchInitialData,
              future: _lodingFutureData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('data: ${snapshot.data.toString()}'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
