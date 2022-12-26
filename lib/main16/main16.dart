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
  State<LogIn> createState() => _MyPageState();
}

class _MyPageState extends State<LogIn> {
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
                      labelStyle: TextStyle(color: Colors.teal)
                    )
                  ),
                  child: Column(
                    children: [
                      TextField(
                        onTap: () {},
                        // controller: controller1,
                        decoration: const InputDecoration(
                          labelText: 'Enter ID: krism01@naver.com',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        onTap: () {},
                        // controller: controller1,
                        decoration: const InputDecoration(
                          labelText: 'Enter Password: 1234',
                          // labelStyle:
                        ),
                        obscureText: true,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 71,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Dice(),
                    ));
                  },
                  child: const Text('로그인'))
            ],
          ),
        ),
      ),
    );
  }
}
