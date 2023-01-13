import 'package:first_project/main24/palette/palette.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'chat_screen/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const ChatScreen();
          }
          return const MyPage();
        }),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool isSignupScreen = true;
  bool isSpinner = false;
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    // TODO: currentContext, currentState, currentWidget
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isSpinner,
        child: Stack(
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
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Welcome',
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 25,
                          letterSpacing: 1,
                        ),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? ' Friend Chat' : ' Back',
                            style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 25,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      isSignupScreen
                          ? 'Signup to continue'
                          : 'SignIn to continue',
                      style: const TextStyle(
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
              // duration: const Duration(milliseconds: 500),
              // curve: Curves.easeIn,
              top: 175,
              left: 20,
              width: MediaQuery.of(context).size.width - 40,
              child: AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                height: isSignupScreen
                    ? MediaQuery.of(context).size.height * 0.4
                    : MediaQuery.of(context).size.height * 0.35,
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
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
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
                      if (isSignupScreen)
                        Form(
                          key: _formKey,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                TextFormField(
                                  // autovalidateMode: AutovalidateMode.always,
                                  onSaved: (newValue) {
                                    userName = newValue!;
                                  },
                                  onChanged: (value) {
                                    userName = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(1),
                                  // Signup - user name key
                                  decoration: InputDecoration(
                                    // icon: Icon(Icons.account_circle),
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                    ),
                                    hintText: 'user name',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Palette.textColor1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Palette.textColor1),
                                    ),
                                  ),
                                  // autofocus: true, // NOTE:시작부터 클릭되도록 설정됨
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  // autovalidateMode: AutovalidateMode.always,
                                  onSaved: (newValue) {
                                    userEmail = newValue!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  validator: (value) {
                                    // 이메일은 @ 포함하지 않았거나 비었으면 확인
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(2),
                                  // Signup - email key
                                  decoration: InputDecoration(
                                    // icon: Icon(Icons.account_circle),
                                    prefixIcon: const Icon(
                                      Icons.email_rounded,
                                    ),
                                    hintText: 'email',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Palette.textColor1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Palette.textColor1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  // autovalidateMode: AutovalidateMode.always,
                                  obscureText: true,
                                  onSaved: (newValue) {
                                    userPassword = newValue!;
                                  },
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Please enter a valid password';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(3),
                                  // Signup - password key
                                  decoration: InputDecoration(
                                      // icon: Icon(Icons.account_circle),
                                      prefixIcon: const Icon(
                                        Icons.password,
                                      ),
                                      hintText: 'password',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Palette.textColor1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Palette.textColor1),
                                      ),
                                      contentPadding: const EdgeInsets.all(10)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      // NOTE: Signup Form
                      if (!isSignupScreen)
                        Form(
                          key: _formKey,
                          // 3개의 입력창
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              // 가로: 아이콘, 이름,
                              children: [
                                const SizedBox(height: 15),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (newValue) {
                                    userEmail = newValue!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  validator: (value) {
                                    // 이메일은 @ 포함하지 않았거나 비었으면 확인
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(4),
                                  // login - email key
                                  decoration: InputDecoration(
                                    // icon: Icon(Icons.account_circle),
                                    prefixIcon: const Icon(
                                      Icons.email_rounded,
                                    ),
                                    hintText: 'email',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Palette.textColor1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Palette.textColor1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  obscureText: true,
                                  onSaved: (newValue) {
                                    userPassword = newValue!;
                                  },
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Please enter a valid password';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(5),
                                  // login - password key
                                  decoration: InputDecoration(
                                      // icon: Icon(Icons.account_circle),
                                      prefixIcon: const Icon(
                                        Icons.password,
                                      ),
                                      hintText: 'password',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Palette.textColor1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Palette.textColor1),
                                      ),
                                      contentPadding: const EdgeInsets.all(10)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      // NOTE: Login Form
                    ],
                  ),
                ),
              ),
            ),
            // NOTE: login, Signup container
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 375,
              left: 0,
              right: 0,
              child: Center(
                // TODO: MouseRegion.cursor
                child: Container(
                  padding: const EdgeInsets.all(11),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        isSpinner = true;
                      });
                      if (isSignupScreen) {
                        _tryValidation();

                        try {
                          final newUser = await _authentication
                              .createUserWithEmailAndPassword(
                                  email: userEmail, password: userPassword);

                          print(
                              'newUser: $newUser'); // UserCredential(additionalUserInfo: AdditionalUserInfo())
                          print(
                              'newUser.user: ${newUser.user}'); // User(displayName: null, email: test4@email.com, emailVerified: false,  uid: zG9UABAJWYhP9nZ, ...)

                          // Usage: https://firebase.flutter.dev/docs/firestore/usage/
                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(newUser.user!.uid)
                              .set({
                            'username': userName,
                            'email': userEmail,
                          });
                          if (newUser.user != null) {
                            setState(() {
                              isSpinner = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '회원가입에 성공하셨습니다.',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.blueGrey,
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please check your email and password'),
                              backgroundColor: Colors.blue,
                            ),
                          );
                        }
                      }
                      setState(() {
                        isSpinner = true;
                      });
                      if (!isSignupScreen) {
                        // login 인 경우
                        _tryValidation();

                        try {
                          final newUser =
                              await _authentication.signInWithEmailAndPassword(
                                  email: userEmail, password: userPassword);

                          if (newUser.user != null) {
                            setState(() {
                              isSpinner = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '로그인에 성공하셨습니다.',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.blueGrey,
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please check your email and password :)'),
                              backgroundColor: Colors.blue,
                            ),
                          );
                        }
                      }
                      // print(userName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const SweepGradient(
                          colors: [
                            Colors.blue,
                            Colors.green,
                            Colors.yellow,
                            Colors.red,
                            Colors.blue,
                          ],
                          stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                        ),
                      ),
                      child: const Icon(Icons.arrow_forward,
                          color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ),
            // NOTE: login, Signup 실행 버튼
            Positioned(
              top: MediaQuery.of(context).size.height - 125,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    isSignupScreen ? 'or Signup with' : 'or SignIn with',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  // mainAxisAlignment: MainAxisAlignment.start,
                  TextButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            '테스트 진행중 입니다',
                          ),
                          backgroundColor: Colors.blueGrey,
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Palette.googleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(150, 40),
                    ),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white70,
                    ),
                    label: const Text(
                      'Google',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
            // NOTE: Google login 버튼
          ],
        ),
      ),
    );
  }
}
