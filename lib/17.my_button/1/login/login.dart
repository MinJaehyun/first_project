import 'package:first_project/17.my_button/1/button/button.dart';
import 'package:first_project/17.my_button/1/google_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late String name;
  late String email;
  late String id;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // test
    if (googleUser != null) {
      print('name = ${googleUser.displayName}');
      print('email = ${googleUser.email}');
      print('id = ${googleUser.id}');
      setState(() {
        name = googleUser.displayName!;
        email = googleUser.email;
        id = googleUser.id;
      });
      var googleLoginInfoMsg = ' name: $name\n email: $email\n id: $id';
      showSnackBarMsg(context, googleLoginInfoMsg);
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sign in'),
        centerTitle: true,
        elevation: 0.2,
      ),
      // note: 간편하게 메서드를 아래로 분리
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Builder(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // note: 일반 버튼
              ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                  Future.delayed(Duration(seconds: 3));

                  // fixme: 아래 테스트 중..
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return GooglePage(name: name, email: email, id: id);
                  // },),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/main17/glogo.png'),
                    const Text('Login with Google',
                        style:
                            TextStyle(color: Colors.black87, fontSize: 15.0)),
                    Opacity(
                        opacity: 0.0,
                        child: Image.asset('assets/main17/glogo.png')),
                  ],
                ),
              ),
              // note: 커스텀 위젯이며, button.dart 파일의 생성자에 들어갈 입력값 만들어서 새 버튼 만들기
              MyButtons(
                image: Image.asset('assets/main17/flogo.png'),
                text: const Text('Login with Facebook',
                    style: TextStyle(color: Colors.white)),
                color: Colors.indigo,
                onPressed: () {
                  var msg = 'Facebook login 을 진행 중입니다.';
                  showSnackBarMsg(context, msg);
                },
                radius: 8.0,
              ),
              // note: 일반 버튼
              ElevatedButton(
                onPressed: () {
                  var msg = 'login 을 진행 중입니다.';
                  showSnackBarMsg(context, msg);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.email),
                    const Text('Login with Email',
                        style: TextStyle(color: Colors.white)),
                    Opacity(
                      opacity: 0.0,
                      child: Image.asset('assets/main17/flogo.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showSnackBarMsg(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
