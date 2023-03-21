import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:first_project/main24/helper/palette/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninSignup extends StatefulWidget {
  const SigninSignup({Key? key}) : super(key: key);

  @override
  State<SigninSignup> createState() => _SigninSignupState();
}

class _SigninSignupState extends State<SigninSignup> {
  bool isSignupScreen = false;
  bool isSpinner = false;
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    // note: _formKey 3가지 속성: currentContext, currentState, currentWidget
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
            // NOTE: 배경이미지
            GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                    child: Image.asset('assets/main24/back.png',
                        width: MediaQuery.of(context).size.width * 1, height: MediaQuery.of(context).size.height * 1, fit: BoxFit.fill))),

            // NOTE: 배경글
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Welcome',
                        style: const TextStyle(color: Palette.googleColor, fontSize: 25, letterSpacing: 1),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? ' Friend Chat' : ' Back',
                            style: const TextStyle(color: Palette.googleColor, fontSize: 25, letterSpacing: 1, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      isSignupScreen ? 'Signup to continue' : 'SignIn to continue',
                      style: const TextStyle(color: Palette.googleColor, fontSize: 25, letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            ),

            // NOTE: login, Signup container
            Positioned(
              top: 175,
              left: 20,
              width: MediaQuery.of(context).size.width - 40,
              child: AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                height: isSignupScreen ? MediaQuery.of(context).size.height * 0.43 : MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: const Offset(0, 3))],
                ),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                child: SingleChildScrollView(
                  // fixme: 회원가입의 password 입력창 클릭 시, 소프트키보드에 입력창이 가려지는 현상 수정하기
                  // 기존: padding: const EdgeInsets.all(20)
                  padding: EdgeInsets.only(bottom: 70),
                  // note: padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) 설정 시, 하단 여백 무제한
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // NOTE: Signin
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
                                      fontSize: 16, fontWeight: FontWeight.bold, color: !isSignupScreen ? Color(0xFF09126C) : Palette.textColor1),
                                ),
                                if (!isSignupScreen) Container(height: 2, width: 55, decoration: const BoxDecoration(color: Colors.orange)),
                              ],
                            ),
                          ),

                          // NOTE: Signup
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
                                      fontSize: 16, fontWeight: FontWeight.bold, color: isSignupScreen ? Palette.activeColor : Palette.textColor1),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    height: 2,
                                    width: 55,
                                    decoration: const BoxDecoration(color: Colors.orange),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      // note: 회원가입 폼
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
                                    prefixIcon: const Icon(Icons.account_circle),
                                    hintText: 'user name',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                  ),
                                  // autofocus: true, // NOTE:시작부터 클릭되도록 설정됨
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  onSaved: (newValue) {
                                    userEmail = newValue!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  validator: (value) {
                                    // 이메일은 @ 포함하지 않았거나 비었으면 확인
                                    if (value!.isEmpty || !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(2),
                                  // Signup - email key
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email_rounded),
                                    hintText: 'email',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
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
                                      // 6글자 이상의 문자를 입력해주세요
                                      return 'Please enter a string over six characters';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(3),
                                  // Signup - password key
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.password),
                                    hintText: 'password',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                    contentPadding: const EdgeInsets.all(10),
                                  ),
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
                                    if (value!.isEmpty || !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(4),
                                  // login - email key
                                  decoration: InputDecoration(
                                    // icon: Icon(Icons.account_circle),
                                    prefixIcon: const Icon(Icons.email_rounded),
                                    hintText: 'email',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
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
                                    prefixIcon: const Icon(Icons.password),
                                    hintText: 'password',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Palette.textColor1)),
                                    contentPadding: const EdgeInsets.all(10),
                                  ),
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

            // NOTE: login, Signup 실행 버튼
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 375,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(11),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), spreadRadius: 5, blurRadius: 5, offset: const Offset(0, 3))],
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      if (isSignupScreen) {
                        setState(() {
                          isSpinner = true;
                        });
                        _tryValidation();
                        try {
                          final newUser = await _authentication.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
                          // print('newUser: $newUser');
                          // UserCredential(additionalUserInfo: AdditionalUserInfo())
                          // print('newUser.user: ${newUser.user}');
                          // User(displayName: null, email: test4@email.com, emailVerified: false,  uid: zG9UABAJWYhP9nZ, ...)
                          // Usage: https://firebase.flutter.dev/docs/firestore/usage/
                          FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({'username': userName, 'email': userEmail});

                          if (newUser.user != null) {
                            setState(() {
                              isSpinner = false;
                            });
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('회원가입에 성공하셨습니다.', style: TextStyle(color: Palette.backgroundColor)),
                                  backgroundColor: Palette.facebookColor),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please check your email and password'),
                              backgroundColor: Palette.facebookColor,
                            ),
                          );
                        }
                      }

                      // login 인 경우
                      if (!isSignupScreen) {
                        setState(() {
                          isSpinner = true;
                        });
                        _tryValidation();
                        try {
                          final newUser = await _authentication.signInWithEmailAndPassword(email: userEmail, password: userPassword);
                          if (newUser.user != null) {
                            setState(() {
                              isSpinner = false;
                            });
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('로그인에 성공하셨습니다.', style: TextStyle(color: Colors.white)), backgroundColor: Palette.facebookColor),
                            );
                          }
                        } catch (e) {
                          if (!mounted) return;
                          // 컨텍스트를 사용자 정의 클래스에 직접 저장하지 말고, 위젯이 마운트되었는지 확실하지 않은 경우 비동기 이후에 컨텍스트를 사용하지 마십시오
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please check your email and password :)'), backgroundColor: Colors.blue),
                          );
                        }
                      }
                      setState(() {
                        isSpinner = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const SweepGradient(
                          colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.blue],
                          stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                        ),
                      ),
                      child: const Icon(Icons.arrow_forward, color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ),

            // NOTE: Google login 버튼
            Positioned(
              top: MediaQuery.of(context).size.height - 125,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup with' : 'or SignIn with', style: const TextStyle(color: Colors.white, fontSize: 16)),
                  TextButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('테스트 진행중 입니다'), backgroundColor: Colors.blueGrey),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Palette.googleColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minimumSize: const Size(150, 40),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white70),
                    label: const Text('Google', style: TextStyle(color: Colors.white70)),
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
