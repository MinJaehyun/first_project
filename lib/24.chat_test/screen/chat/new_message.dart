import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final controller = TextEditingController();
  var userMessage;

  @override
  Widget build(BuildContext context) {
    void sendMessage() {
      FocusScope.of(context).unfocus();
      FirebaseFirestore.instance.collection('/chats/pZaVfyO0YlsbF0VMyTLL/messages/').add(
        {
          'text': userMessage,
          'time': DateTime.now(),
        },
      );
      controller.clear();
    }

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 13),
      child: Row(
        children: [
          // note: TextField위젯을 Expanded위젯으로 감싸지 않으면 불필요한 공간 차지한다
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Send a message',
              ),
              onChanged: (value) {
                setState(
                  () {
                    userMessage = value;
                  },
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
