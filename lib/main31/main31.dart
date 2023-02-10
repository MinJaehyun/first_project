import 'package:first_project/main31/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  // final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              GetBuilder<Controller>(
                init: Controller(),
                builder: (controller) {
                  return Text(
                    // 'count of controller.dart is: ${controller.count}',
                    'count of controller.dart is: ${Get.find<Controller>().count}',
                    style: const TextStyle(fontSize: 30),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // controller.inclementCount();
                  Get.find<Controller>().inclementCount();
                },
                child: const Text('Count btn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}