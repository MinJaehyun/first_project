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
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/dog1.jpg'),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/dog1.jpg'),
                  backgroundColor: Colors.white,
                ),
              ],
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/dog1.jpg'),
                backgroundColor: Colors.white,
              ),
                accountName: const Text('Min JH'),
                accountEmail: const Text('krism01@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40)),
              ),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.add),
              onLongPress: () {
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('setting'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('question'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('question');
              },
            ),
          ],

        ),
      ),
    );
  }
}
