import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '14~15',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('AppBar Icon Menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {
            print('shopping_cart btn is clicked');
          }, icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {
            print('shopping_cart btn is clicked');
          }, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding:const  EdgeInsets.all(20),
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/dog1.jpg'),
                backgroundColor: Colors.white,
              ),
                accountName: Text('Min JH'),
                accountEmail: Text('krism01@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40)),
              ),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
            ),
          ],
        ),
      ),
    );
  }
}
