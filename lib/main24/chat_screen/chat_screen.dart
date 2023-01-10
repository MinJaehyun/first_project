import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggerUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      // print(user);
      loggerUser = user;
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat sreen'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async {
            // 회원탈퇴
            // FirebaseAuth.instance.currentUser!.delete();
            // TODO: user 제거 및 login page로 돌아가기
            await FirebaseAuth.instance.signOut().then((result) => {
              // print("test then result")
            });
            Navigator.pop(context);
            // NOTE: 제일 처음으로 돌아가기
            // Navigator.of(context).popUntil((route) => route.isFirst);
          }, icon: const Icon(Icons.logout)),
        ],
      ),
      body: const Center(
        child: Text(
          'chat screen',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}
