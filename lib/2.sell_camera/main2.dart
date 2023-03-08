import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('화성시'), actions: const [
        Icon(Icons.search),
        SizedBox(width: 5),
        Icon(Icons.menu),
        SizedBox(width: 5),
        Icon(Icons.add_alert)
      ]),

      body: const BodyContext(),

      // NOTE: 박스 높낮이 설정하기 위해 Container() 로 감싸기
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page)
          ],
        ),
      ),
    ));
  }
}

class BodyContext extends StatelessWidget {
  const BodyContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Center(child: Image.asset('assets/main2/camera1.jpg', width: 130)),
          const SizedBox(width: 10),
          // note: 가로 영역 벗어났을 경우: Expanded()로 감싸거나, Flexible()로 감싼다
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Text('기배로 10분 전'),
                Text('76만원'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.favorite),
                    Text('4'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
