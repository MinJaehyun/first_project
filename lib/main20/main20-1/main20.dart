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
  String bottomData = ' 버튼을 사용하지 않고,\n 데이터를 읽어 오는 중입니다';
  var style = const TextStyle(fontSize: 18, color: Colors.redAccent);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // note: 버튼을 클릭하여 데이터를 가져와서 변경하는 방법
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: const Text('Future btn'),
            ),
            const SizedBox(height: 22),
            Text(currentData, style: style),
            const Divider(height: 20, thickness: 3.5, indent: 55, endIndent: 55),
            const SizedBox(height: 22),

            // note: 실시간으로 데이터를 가져와서 변경하는 방법
            FutureBuilder(

              // note: 아..착각했다 future 에는 return 될 결과를 작성해야 한다!
              // note: 초기값 설정은 initialData, ConnectionState.waiting 설정 안 되였으면 이 초기값을 나타낸다
              // initialData: "Initial Data",
              initialData: bottomData,

              // note: future: 에는 done 에서 사용할 마지막 출력할 값을 설정한다
              future: myData(),
              builder: (context, snapshot) {
                print('FutureBuilder re builder');
                if (snapshot.connectionState == ConnectionState.none) {
                  // note: done 언제 사용? 앱이 초기화 중이거나, 네트워크 연결이 끊기거나, 데이터 로딩 전일 때.
                  return Text('앱이 초기화 중이거나, 네트워크 연결이 끊기거나, 데이터를 로딩 전 입니다.');
                }
                // note: waiting 는 연결 중이므로 대기중인 문자열이나 로딩을 출력한다
                else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [Text(bottomData, style: style), CircularProgressIndicator()],
                  );
                }
                // note: ConnectionState.done 상태이며, future: myData() 실행값은 snapshot.data 에 담겨있다
                return Text(snapshot.data!, style: TextStyle(fontSize: 25));
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
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
        style = const TextStyle(fontSize: 22, color: Colors.green);
      });
    });
  }

  Future<String> myData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'The data is fetched';
  }
}
