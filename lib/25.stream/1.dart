import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '25',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int year = 2023;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        initialData: year,
        stream: addTest(),
        builder: (context, snapshot) {
          final yearStream = snapshot.data!;
          return Center(
            child: Column(
              children: [
                // NOTE: 변수 yearStream 가져오려면 ?
                Text('defalut: $year',style: const TextStyle(fontSize: 33),),
                const Divider(height: 21,thickness: 11,),
                Text('$yearStream',style: const TextStyle(fontSize: 33),),
                const Divider(height: 21,thickness: 11,),
                Text(yearStream.toString(),style: const TextStyle(fontSize: 33),),
              ],
            ),
          );
        },
      ),
    );
  }

  Stream<int> addTest() {
    return Stream<int>.periodic(
      const Duration(seconds: 2),
          (computationCount) {
        return year + (computationCount); // 2024,2025, ...
      },
    );
  }

}
