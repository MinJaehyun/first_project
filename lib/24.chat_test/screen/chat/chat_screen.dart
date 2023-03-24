import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/24.chat_test/screen/chat/add_image.dart';
import 'package:first_project/24.chat_test/screen/chat/message.dart';
import 'package:first_project/24.chat_test/screen/chat/new_message.dart';
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
  File? image;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      loggerUser = user;
    } catch (e) {
      print(e);
    }
  }

  void changeImage(File image) {
    image = image;
  }

  void profilePopup() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          // todo: 하위만들어서 데이터 내려줘서, 자식에서 부모의 함수 실행하여 userImage 변경하여 reload 구현하기
          child: AddImage(changeImage),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // todo: 1.팝업띄우기, 2.image_picker로 사진찍거나 갤러리에서 가져오기(2가지기능구현하기), 3.
            profilePopup();
          },
          icon: Icon(Icons.account_circle),
        ),
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
      body: Container(
        child: Center(
          child: Column(
            children: [
              // note: 컬럼위젯 내에 리스트뷰가 무조건 화면 내의 모든 공간을 차지하므로, Expanded 설정함
              // note: Message 내에서 NewMessage()까지 처리하면 안된다
              Expanded(child: Message()),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}

// todo: note: FirebaseAuth.instance.currentUser 통해 로그인 한 유저를 확인할 수 있다. 이를 활용하여 메시지의 주인을 나타낼 수 있다
