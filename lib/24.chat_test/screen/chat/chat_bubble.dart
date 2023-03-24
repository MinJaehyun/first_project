import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';

class ChatBubbles extends StatefulWidget {
  const ChatBubbles(this.text, this.isMe, this.userName, this.imageURL, {Key? key}) : super(key: key);
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
            backgroundImage: widget.imageURL != null ? NetworkImage(widget.imageURL!) : null,
            // backgroundImage: NetworkImage(widget.imageURL!),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              // note: 작성자가 로그인한 유저와 다른 경우
              if (!widget.isMe)
                ChatBubble(
                  clipper: ChatBubbleClipper4(type: BubbleType.sendBubble),
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 20),
                  backGroundColor: Color(0xffE7E7ED),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    child: Column(
                      children: [
                        Text(widget.userName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        Text(widget.text, style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                )
              // note: 작성자가 로그인한 유저와 같은 경우
              else if (widget.isMe)
                ChatBubble(
                  clipper: ChatBubbleClipper4(type: BubbleType.receiverBubble),
                  backGroundColor: Colors.blue,
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    child: Column(
                      children: [
                        Text(widget.userName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text(widget.text, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
