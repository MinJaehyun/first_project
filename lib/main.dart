import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('화성시'), actions: const [Icon(Icons.search), Icon(Icons.menu), Icon(Icons.add_alert)]),

        body: Container(
          // NOTE: 상품 설명
          height: 150,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset('camera1.jpg', width: 300),
              Flexible(flex: 1,child: Container(
                // width: 300,
                child: Column(
                  // NOTE: Column 에서 X축 정렬
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함', style: TextStyle(fontWeight: FontWeight.w800)),
                    const Text('기배로, 10분 전'),
                    const Text('76만원'),
                    Row(
                      // NOTE: Row 에서 X축 정렬
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.favorite),
                          Text('4'),
                        ]),
                  ],
                ),
              ),)
            ],
          ),
        ),

        // NOTE: 박스 높낮이 설정하기 위해 Container() 로 감싸기
        bottomNavigationBar: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [Icon(Icons.phone),Icon(Icons.message),Icon(Icons.contact_page)],
          ),

        ),
      )
    );
  }
}
