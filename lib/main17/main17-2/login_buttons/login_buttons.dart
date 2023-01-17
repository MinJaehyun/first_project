import 'package:first_project/main17/main17-2/my_button/my_button.dart';
import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sign in'),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              // note: 위젯형태로 넣을 거면 아래처럼 처리하고
              image: Image.asset('assets/main17/glogo.png'),
              // note: Color 형태로 넣을 거면 아래처럼 처리한다
              color: Colors.white,
              radius: 4.0,
              loginText: const Text(
                'Login with Google',
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ),
            MyButton(
              image: Image.asset('assets/main17/flogo.png'),
              // note: 에러 시, color: Colors.blue[900], 아래로 해결
              color: Colors.blue.shade900,
              radius: 4.0,
              loginText: const Text(
                'Login with Facebook',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
      ),
    );
  }
}
