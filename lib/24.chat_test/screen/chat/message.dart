import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
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
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(docs[index]['text'], style: TextStyle(fontSize: 18)),
                    // Divider(thickness: 3),
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
