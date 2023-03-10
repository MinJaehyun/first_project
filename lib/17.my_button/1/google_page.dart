// note: fixme: 사용하지 않고, 수정 중인 페이지
import 'package:flutter/material.dart';

class GooglePage extends StatelessWidget {
  GooglePage(
      {Key? key, required this.name, required this.email, required this.id})
      : super(key: key);
  final String name;
  final String email;
  final String id;

  // Future<void> future1() async{
  //   // 구글 로그인 중입니다.
  //   return await Future.delayed(Duration(seconds: 3), () => print('구글 로그인 중입니다.'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: FutureBuilder(
        //   future: future1(),
        //   builder: (context, snapshot) {
            // if(snapshot.hasData == false) {
            //   return Center(child: CircularProgressIndicator());
            // }
            // if(snapshot.connectionState == ConnectionState.waiting) {
            //   return Center(child: CircularProgressIndicator());
            // }
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('name: $name',
                      style: TextStyle(fontSize: 25)),
                  Text('email: $email',
                      style: TextStyle(fontSize: 25)),
                  Text('id: $id', style: TextStyle(fontSize: 25)),
                ],
              ),
            ),
        ),
    );
  }
}
