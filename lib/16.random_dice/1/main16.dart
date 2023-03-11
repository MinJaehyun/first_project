import 'package:first_project/16.random_dice/1/dice.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: const [Icon(Icons.search)],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/main16/login.png'),
                const SizedBox(height: 11),
                // note: Theme 위젯 사용하여 현재 페이지 내의 전체 input 에 라벨 색상 설정
                Theme(
                  data: ThemeData(
                      inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.purple))),
                  child: Column(
                    children: [
                      TextField(
                          // autofocus: true, // 앱 화면 focus 맞추기
                          controller: idController,
                          onTap: () {
                            debugPrint(idController.text);
                          },
                          decoration: const InputDecoration(
                              labelText: 'Enter ID: krism01@naver.com'),
                          keyboardType: TextInputType.emailAddress),
                      TextField(
                        onTap: () {
                          debugPrint(passwordController.text);
                        },
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Password: 1234',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 71),
                      ElevatedButton(
                          onPressed: () {
                            if (idController.text == 'krism01@naver.com' &&
                                passwordController.text == '1234') {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Dice()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('로그인에 성공 하셨습니다.',
                                          textAlign: TextAlign.center),
                                      backgroundColor: Colors.blue,
                                      duration: Duration(seconds: 2)));
                            } else if (idController.text ==
                                    'krism01@naver.com' &&
                                passwordController.text != '1234') {
                              String str = '잘못된 pwd 를 입력하셨습니다';
                              showSnackBar(context, str);
                            }
                            // 2. id 는 틀리고, pwd 는 맞는 경우
                            else if (idController.text != 'krism01@naver.com' &&
                                passwordController.text == '1234') {
                              String str = '잘못된 id를 입력하셨습니다';
                              showSnackBar(context, str);
                            }
                            // 3. id 와 pwd 둘 다 틀리거나, 입력 정보가 한개라도 없는 경우
                            else {
                              String str = 'id 와 pwd 둘 다 틀리거나, \n 입력 정부를 한개라도 입력하지 않으셨습니다';
                              showSnackBar(context, str);
                            }
                          },
                          child: const Text('로그인'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 리펙토링
  void showSnackBar(context, String str) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('id 와 pwd 둘 다 틀리거나, \n 입력 정부를 한개라도 입력하지 않으셨습니다',
              textAlign: TextAlign.center),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blue),
    );
  }
}
