import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/24.chat_test/screen/signin_signup/signin_signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  User? loggerUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      // print(user);
      loggerUser = user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Chat sreen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut().then((result) => {});
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SigninSignup();
                  },
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      // todo: 직접 Firestore 웹사이트에 접근하여 컬렉션 및 문서 및 필드를 작성하였는데, 코드를 통해 message를 몇 개 추가해보기. add? set?
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('/chats/pZaVfyO0YlsbF0VMyTLL/messages').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(docs[index]['text'], style: TextStyle(fontSize: 25)),
                    Divider(thickness: 3),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// todo: note: FirebaseAuth.instance.currentUser 통해 로그인 한 유저를 확인할 수 있다. 이를 활용하여 메시지의 주인을 나타낼 수 있다
