import 'package:first_project/main28/service.dart';
import 'package:first_project/main28/user.dart';
import 'package:flutter/material.dart';

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

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<User> _user = <User>[];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // getInfo() 의 return 값은 user
    Service.getInfo().then((value) {
      setState(() {
        _user = value;
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('mjh'),
            subtitle: Text('krism01@naver.com'),
            trailing: Icon(Icons.phone_android),
          );
        },
      ),
    );
  }
}
