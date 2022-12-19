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
        title: Text('Snack Bar'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // print('clicked is btn');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Text('Hello'),
                    Expanded(child: Container(height: 0)),
                    CircularProgressIndicator(),
                    // Text('Hello'),
                  ],
                ),
                backgroundColor: Colors.amber,
                duration: Duration(milliseconds: 3000),
                action: SnackBarAction(
                  label: 'UNDO',
                  textColor: Colors.teal,
                  onPressed: () {},
                ),
              ),
            );
          },
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          child: Text('snack bar btn'),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}
