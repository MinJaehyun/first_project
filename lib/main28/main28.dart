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

  Future<void> dialog(context, index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Text(_user[index].name, style: const TextStyle(fontSize: 25, color: Colors.blue)),
              Text(_user[index].email, style: const TextStyle(fontSize: 15, color: Colors.grey)),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

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
        title: Text(isLoading ? 'User' : 'loading...'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(_user[index].name),
            subtitle: Text(_user[index].email),
            trailing: IconButton(
              onPressed: () {
                // 팝업창
                dialog(context, index);
              },
              icon: const Icon(Icons.phone_android),
            ),
          );
        },
      ),
    );
  }
}
