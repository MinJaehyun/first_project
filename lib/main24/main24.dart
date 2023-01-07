import 'package:first_project/main24/palette/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            // image 밀림 해결
            child: SingleChildScrollView(
              child: Image.asset(
                'assets/main24/background.jpeg',
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // NOTE: 배경이미지
          Positioned(
            top: 100,
            left: 40,
            child: Container(
              decoration: const BoxDecoration(
                  // color: Colors.white,
                  ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Padding(padding: EdgeInsets.all(20)),
                      RichText(
                        text: const TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 25,
                              letterSpacing: 1),
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: ' Friend Chat',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 25,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    // textAlign: TextAlign.left,
                    'Signup to continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // NOTE: 배경글
          Positioned(
            top: 175,
            left: 20,
            width: MediaQuery.of(context).size.width - 40,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (!isSignupScreen)
                              Container(
                                height: 2,
                                width: 55,
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                ),
                              ),
                          ],
                        ),
                      ),
                      // NOTE: login
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (isSignupScreen)
                              Container(
                                height: 2,
                                width: 55,
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                ),
                              ),
                          ],
                        ),
                      ),
                      // NOTE: Signup
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Form(
                    // 3개의 입력창
                    child: Column(
                      // 가로: 아이콘, 이름,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            // icon: Icon(Icons.account_circle),
                            prefixIcon: const Icon(
                              Icons.account_circle,
                            ),
                            hintText: 'user name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Palette.textColor1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Palette.textColor1),
                            ),
                          ),
                          // autofocus: true, // NOTE:시작부터 클릭되도록 설정됨
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            // icon: Icon(Icons.account_circle),
                            prefixIcon: const Icon(
                              Icons.email_rounded,
                            ),
                            hintText: 'email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Palette.textColor1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Palette.textColor1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            // icon: Icon(Icons.account_circle),
                            prefixIcon: const Icon(
                              Icons.password,
                            ),
                            hintText: 'password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Palette.textColor1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Palette.textColor1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // NOTE: login, Signup container
        ],
      ),
    );
  }
}
