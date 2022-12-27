import 'package:flutter/material.dart';
import '../button/button.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sign in'),
        centerTitle: true,
        elevation: 0.2,
      ),
      // 해당 body 안에서만 버튼을 호출하여 사용하기 위한 위젯
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: 리펙토리 전 버튼
          ElevatedButton(
            onPressed: () {},
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
                    style: TextStyle(color: Colors.black87, fontSize: 15.0)),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset('assets/main17/glogo.png'),
                ),
              ],
            ),
          ),

          // TODO: 리펙토리 전 버튼
          // button.dart 로 옮긴 버튼 위젯
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blue[900],
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Image.asset('assets/main17/flogo.png'),
          //       const Text('Login with Facebook',
          //           style: TextStyle(color: Colors.white)),
          //       Opacity(
          //         opacity: 0.0,
          //         child: Image.asset('assets/main17/flogo.png'),
          //       ),
          //     ],
          //   ),
          // ),

          // button.dart 파일의 생성자에 들어갈 입력값 만들어서 새 버튼 만들기
          MyButtons(
            image: Image.asset('assets/main17/flogo.png'),
            text: const Text('Login with Facebook',
                style: TextStyle(color: Colors.white)),
            color: Colors.indigo, // Colors.blue[900] 설정 시, type 에러 발생
            onPressed: () {},
            radius: 8.0,
          ),

          // TODO: 리펙토리 전 버튼
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
    );
  }
}
