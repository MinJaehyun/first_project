import 'package:first_project/main31/main31_2/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CountController>(
                builder: (_) => Text('count is: ${countController.count1}',
                    style: TextStyle(fontSize: 24)),
              ),
              // 버튼은 새로 그릴필요 없으므로 GetBuilder 설정하지 않는다
              ElevatedButton(
                onPressed: () => countController.coutUpBtn(),
                child: Text('count up btn', style: TextStyle(fontSize: 24)),
              ),
              ElevatedButton(
                onPressed: () {
                  countController.addSum();
                },
                child: Text('add sum btn', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
