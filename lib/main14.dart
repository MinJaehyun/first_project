import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  var jobList = ['Dentist', 'Pharmacist', 'Programmer'];
  var imageList = [
    'assets/main14/image1.png',
    'assets/main14/image2.png',
    'assets/main14/image3.png',
  ];
  var descriptions = [
    'Moving the ownership of non-trivial UI-state-driving business logic out of the list child subtree.',
    "Letting KeepAlive be the root widget of the list child widget subtree that needs to be preserved.",
    'This only works if addAutomaticKeepAlives and addRepaintBoundaries are false since those parameters cause the ListView to wrap each child widget subtree with other widgets.'
  ];

  // showPopup
  void showPopup(context, job, image, description) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Expanded(
              child: ListView.builder(
                  // itemCount: jobList.length, 설정 시, 모달창안에 같은 내용이 3번 반복된다
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            image,
                            alignment: Alignment.center,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description,
                            // NOTE: maxLines:15 설정 시, 화면 비율 변경하면 Overflow 발생한다
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          label: const Text('close'),
                        )
                      ],
                    );
                  }),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ListView',
            style: TextStyle(color: Colors.grey[500]),
          ),
          elevation: 0,
          backgroundColor: Colors.grey[100],
        ),
        body: ListView.builder(
          itemCount: jobList.length,
          itemBuilder: (context, index) {
            // NOTE: Card 위젯에서 제스처 감지 기능 구현
            return GestureDetector(
              onTap: () {
                // debugPrint('cliced is GestureDetector onTap');
                // NOTE: showPopup에 상단에 정의한 변수를 인자에 넣어 실행하여 팝업창(or 모달창) 띄우기
                showPopup(context, jobList[index], imageList[index],
                    descriptions[index]);
              },
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(imageList[index]),
                      // NOTE: Image(image: AssetImage(imageList[index])); // 사용법
                    ),
                    SizedBox(
                      // NOTE: width: 511 설정 시, 반응형 웹으로 테스트하면 overflow 발생
                      width: width,
                      child: Center(
                        child: Column(
                          children: [
                            Text(jobList[index],
                                style: const TextStyle(
                                  fontSize: 22,
                                )),
                            Text(
                              descriptions[index],
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
