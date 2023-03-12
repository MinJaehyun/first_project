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
  String fetchBtnData = 'no data found';
  String fetchInitialData = '데이터를 로딩 중입니다';

  // note: return 값이 없는 경우 형식
  Future<void> fetchFun() async {
    debugPrint('데이터 전송 시작');
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() => fetchBtnData = 'The data is fetched');
    });
    debugPrint('데이터 전송 종료');
  }

  // note: return 값이 있는 경우 형식
  Future<String> _lodingFutureData() async {
    await Future.delayed(const Duration(seconds: 2));
    return '데이터 로딩이 완료 되었습니다';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future test'), centerTitle: true),
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
                const SizedBox(height: 25),
                // note: 기존 fetchBtnData 값은 btn 클릭 시 리빌딩 되므로, 바뀐 fetchBtnData 값을 UI에 나타낸다
                Text(fetchBtnData, style: const TextStyle(fontSize: 35))
              ],
            ),
            const Divider(thickness: 5),
            FutureBuilder(
              // note: 초기값 설정하여 최초 화면에 fetchInitialData 값을 UI에 나타낸다
              // initialData: fetchInitialData,
              // note: future: 에는 snapshot.data 에 담길값을 담는다.
              future: _lodingFutureData(),
              builder: (context, AsyncSnapshot snapshot) {
                // note: snapshot.connectionState 사용하지 않고 snapshot.hasData 사용한 이유와 차이점은 ?
                // 데이터 반환 실패 했으면
                if (snapshot.hasData == false) {
                  print('FutureBuilder');
                  // note: 데이터가 없다는 의미는 아직 들어오기 전이라는 의미이므로 로딩 띄우면 된다
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                // 데이터 반환 성공 했으면
                else {
                  print('FutureBuilder re builder');
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
