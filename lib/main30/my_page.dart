import 'package:first_project/main30/cloud_firestore_screen/cloud_firestore_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                    Text(
                      'Hello',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.blueGrey,
                            letterSpacing: .5,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Welcom back',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              // note: sign in page
              Column(
                children: [
                  // note: Email
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
    );
  }

  // 로그인
  void signInFunc() async {
    /**
     * DB 에 sign 머시기 이용하여 로그인 하기, 대신 아이디가 존재해야 한다
     * */
    var email = emailController.text;
    var password = passwordController.text;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // print(credential);
      if (!mounted) return;
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CloudFirestoreScreen()),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
