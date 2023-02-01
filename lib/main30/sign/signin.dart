import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/main30/cloud_firestore_screen/cloud_firestore_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// note: login & product create popup
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSpinner = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isSpinner,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset('assets/main30/phone.png', height: 100),
                        const SizedBox(height: 15),
                        Text('Hello',
                            style: GoogleFonts.bebasNeue(
                                textStyle: const TextStyle(
                                    color: Colors.blueGrey,
                                    letterSpacing: .5,
                                    fontSize: 36))),
                        const SizedBox(height: 15),
                        Text('Welcom back',
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  // note: sign in page
                  Column(
                    children: [
                      // note: email
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // note: Password
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          // 로그인
                          signInFunc();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent[100],
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Sign in'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not a member?'),
                          TextButton(
                            onPressed: () {
                              // todo: 회원가입 만들기
                            },
                            child: const Text('Register Now!',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 로그인
  void signInFunc() async {
    var email = emailController.text;
    var password = passwordController.text;
    setState(() {
      isSpinner = true;
    });

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (!mounted) return;
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CloudFirestoreScreen()),
        );
      }
      // todo: 편의상 개발 완료 후, 아래 내용 설정하기 note: 로그아웃 시, 계정 정보 삭제
      // emailController.clear();
      // passwordController.clear();
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'The password is invalid or the user does not have a password.'),
          backgroundColor: Colors.blue,
        ),
      );
    }
    // fix: 로딩 문제 해결
    setState(() {
      isSpinner = false;
    });
  }
}
