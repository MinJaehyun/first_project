import 'package:first_project/14.dialog_delivery_data/dialog/dialog.dart';
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
    // note: showDialog 위젯
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        // note: 커스텀 팝업창
        return MyDialog(context, job, description: description, image: image);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView', style: TextStyle(color: Colors.grey[500])),
        elevation: 0,
        backgroundColor: Colors.grey[100],
      ),
      body: ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          // NOTE: Card 위젯에 제스처감지 기능 구현
          return GestureDetector(
            onTap: () {
              // NOTE: Card 클릭 시, 상단에 정의한 변수를 showPopup함수의 인자로 넣어 실행하여 팝업창 띄우기
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
                  ),
                  SizedBox(
                    // NOTE: width: 511 설정 시, 반응형 웹으로 테스트하면 overflow 발생
                    width: width,
                    child: Center(
                      child: Column(
                        children: [
                          Text(jobList[index],
                              style: const TextStyle(fontSize: 22)),
                          Text(descriptions[index], maxLines: 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
