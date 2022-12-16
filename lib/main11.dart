import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: menu layout 만든 후, leading 대신 drawer menu bar 로 만들기
        leading: const Icon(Icons.menu),
        title: const Text('Login in'),
        centerTitle: true,
        // TODO: 추 후, icon 대신 ElevatedBtn 설정하여 기능 구현하기
        actions: const [Icon(Icons.search)],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 50)),
              const Image(
                image: AssetImage('assets/camera1.jpg'),
                width: 150.0,
                height: 150.0,
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.teal))),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'ID: (테스터 계정: tester)',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password: (테스터 계정: 1234)',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(height: 30),
                      ButtonTheme(
                        minWidth: 100.0,
                          height: 50.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                            onPressed: (){},
                            child: const Icon(Icons.arrow_forward, color: Colors.white, size: 30,),
                          )
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}
