import 'package:cloud_firestore/cloud_firestore.dart';
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
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((result) =>
                {
                  // print("test then result")
                });
                Navigator.pop(context);
                // NOTE 제일 처음으로 돌아가기: Navigator.of(context).popUntil((route) => route.isFirst);
                // NOTE 회원탈퇴: FirebaseAuth.instance.currentUser!.delete();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(
              '/chats/pZaVfyO0YlsbF0VMyTLL/messages').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            // 우선 처리해야 한다
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    docs[index]['text'],
                    style: TextStyle(fontSize: 33),
                  ),
                );
              },

            );
          }),
    );
  }
}
