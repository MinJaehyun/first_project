import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogIn(),
    );
  }
}

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
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/main17/flogo.png'),
                  const Text('Login with Facebook',
                      style: TextStyle(color: Colors.white)),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('assets/main17/flogo.png'),
                  ),
                ],
              ),
            ),
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
      ),
    );
  }
}
