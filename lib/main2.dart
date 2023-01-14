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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 가로 1.이미지
          Image.asset('assets/camera1.jpg', width: 120),
          const SizedBox(width: 10),
          // 가로 2.Flexible 박스
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                // NOTE: Column 에서 X축 정렬 방법: CrossAxisAlignment
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 세로 Text 3개
                  const Text('캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  const Text('기배로, 10분 전'),
                  const Text('76만원'),
                  Row(
                      // NOTE: 아이콘과 숫자를 우측에 배치하는 방법? Row 에서 x축 정렬
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.favorite),
                        Text('4'),
                      ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
