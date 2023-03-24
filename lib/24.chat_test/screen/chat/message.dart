import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/24.chat_test/screen/chat/chat_bubble.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    final newUser = FirebaseAuth.instance.currentUser;

    return Container(
      child: StreamBuilder(
        // note: orderBy defalut: ascending
        stream: FirebaseFirestore.instance.collection('/chats/pZaVfyO0YlsbF0VMyTLL/messages').orderBy('time', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            // todo: ListView.builder 속성 검색
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (BuildContext context, int index) {
              // print("docs[index]['userId']: ${docs[index]['userId'].runtimeType}");
              return ChatBubbles(
                docs[index]['text'],
                // note: required 설정 안 했으므로 순서 주의
                docs[index]['userId'] == newUser!.uid,
                docs[index]['userName'],
                docs[index]['pickedImage'],
              );
            },
          );
        },
      ),
    );
  }
}
