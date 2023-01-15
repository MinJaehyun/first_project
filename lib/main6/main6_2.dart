import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '18',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('snack bar btn'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Text('Hello'),
                    Expanded(child: Container(height: 110)),
                    // const CircularProgressIndicator(),
                  ],
                ),
                backgroundColor: Colors.amber,
                duration: const Duration(milliseconds: 3000),
                action: SnackBarAction(
                  label: 'UNDO',
                  textColor: Colors.teal,
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}
