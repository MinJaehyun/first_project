import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.cyan),
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
  TextEditingController controllerInputTextId = TextEditingController();
  TextEditingController controllerInputTextPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: const [Icon(Icons.search)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/main16/login.png',
              ),
              const SizedBox(
                height: 11,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                      // primaryColor: Colors.teal,
                      inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.teal))),
                  child: Column(
                    children: [
                      TextField(
                        controller: controllerInputTextId,
                        onTap: () {
                          debugPrint(controllerInputTextId.text);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Enter ID: krism01@naver.com',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        onTap: () {
                          debugPrint(controllerInputTextPwd.text);
                        },
                        controller: controllerInputTextPwd,
                        decoration: const InputDecoration(
                          labelText: 'Enter Password: 1234',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 71,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // 조건이 둘 다 만족하는 경우
                            if (controllerInputTextId.text ==
                                    'krism01@naver.com' &&
                                controllerInputTextPwd.text == '1234') {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Dice(),
                              ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  '로그인에 성공 하셨습니다.',
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.blue,
                                duration: Duration(seconds: 2),
                              ));
                            }
                            // 1. id 는 맞고, pwd 가 틀린 경우
                            else if (controllerInputTextId.text ==
                                    'krism01@naver.com' &&
                                controllerInputTextPwd.text != '1234') {
                              showSnackBar1(context);
                            }
                            // 2. id 는 틀리고, pwd 는 맞는 경우
                            else if (controllerInputTextId.text !=
                                    'krism01@naver.com' &&
                                controllerInputTextPwd.text == '1234') {
                              showSnackBar2(context);
                            }
                            // 3. id 와 pwd 둘 다 틀리거나, 입력 정보가 한개라도 없는 경우
                            else {
                              showSnackBar3(context);
                            }
                          },
                          child: const Text('로그인'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. id 는 맞고, pwd 가 틀린 경우
void showSnackBar1(context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '잘못된 pwd 를 입력하셨습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.blue,
  ));
}

// 2. id 는 틀리고, pwd 는 맞는 경우
void showSnackBar2(context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '잘못된 id를 입력하셨습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.blue,
  ));
}

// 3. id 와 pwd 둘 다 틀리거나, 입력 정보가 한개라도 없는 경우
void showSnackBar3(context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      'id 와 pwd 둘 다 틀리거나, \n 입력 정부를 한개라도 입력하지 않으셨습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.blue,
  ));
}
