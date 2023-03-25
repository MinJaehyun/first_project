import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';

class ChatBubbles extends StatefulWidget {
  const ChatBubbles(this.text, this.isMe, this.userName, this.imageURL,
      {Key? key})
      : super(key: key);
  final dynamic text;
  final bool isMe;
  final String userName;
  final String? imageURL;

  @override
  State<ChatBubbles> createState() => _ChatBubblesState();
}

class _ChatBubblesState extends State<ChatBubbles> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: widget.isMe ? 3 : null,
          right: widget.isMe ? null : 3,
          top: 65,
          child: CircleAvatar(
              backgroundImage: widget.imageURL != null
                  ? NetworkImage(widget.imageURL!)
                  : null),
        ),
        Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              // note: 작성자가 로그인한 유저와 다른 경우
              ChatBubble(
                clipper: !widget.isMe
                    ? ChatBubbleClipper5(type: BubbleType.sendBubble)
                    : ChatBubbleClipper5(type: BubbleType.receiverBubble),
                alignment:
                    !widget.isMe ? Alignment.topRight : Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 20),
                backGroundColor: !widget.isMe ? Color(0xffE7E7ED) : Colors.blue,
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7),
                  child: Column(
                    children: [
                      Text(widget.userName,
                          style: TextStyle(
                              color: !widget.isMe ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(widget.text,
                          style: TextStyle(
                              color:
                                  !widget.isMe ? Colors.black : Colors.white))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
