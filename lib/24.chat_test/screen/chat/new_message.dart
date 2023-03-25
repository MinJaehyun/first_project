import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final controller = TextEditingController();
  var userMessage;
  var pickedImage;

  @override
  Widget build(BuildContext context) {
    void sendMessage() async {
      FocusScope.of(context).unfocus();
      var newUser = await FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance.collection('user').doc(newUser!.uid).get();
      await FirebaseFirestore.instance.collection('/chats/pZaVfyO0YlsbF0VMyTLL/messages/').add(
        {
          'text': userMessage,
          'time': DateTime.now(),
          'userId': newUser.uid,
          'userName': userData.data()!['username'] != null ? userData.data()!['username'] : newUser!.displayName,
          'pickedImage': userData.data()!['pickedImage'] != null ? userData.data()!['pickedImage'] : newUser!.photoURL,
        },
      );
      controller.clear();
    }

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          // note: TextField 위젯을 Expanded 위젯으로 감싸지 않으면 불 필요한 공간 차지함
          Expanded(
            child: TextField(
              maxLines: 2,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Send a message',
              ),
              onChanged: (value) {
                setState(
                  () => userMessage = value,
                );
              },
            ),
          ),
          IconButton(
            onPressed: userMessage != null
                ? userMessage.trim().isEmpty
                    ? null
                    : sendMessage
                : () {},
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
