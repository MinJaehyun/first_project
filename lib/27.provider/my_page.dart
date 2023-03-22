import 'package:first_project/main27/provider/meat_model.dart';
import 'package:flutter/material.dart';
import '../main27/screen/screen.dart';
import 'package:provider/provider.dart';
import 'package:first_project/main27/provider/fish_model.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ScreenA(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<FishModel>(context, listen: false).fishNumberPlus();
          Provider.of<MeatModel>(context, listen: false).meatNumberPlus();
        },
        label: const Text('ALL PLUS'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
