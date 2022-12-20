import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '14~15',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // used UserAccountDrawerHeader
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: const FlutterLogo(),
                accountName: const Text('mjh'),
                accountEmail: const Text('krism01@naver.com'),
                otherAccountsPictures: const [
                  FlutterLogo(),
                  FlutterLogo(),
                ],
                onDetailsPressed: () {
                  print('arrow is clicked');
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  print('home');
                },
                trailing: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),

      // used custum Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.tealAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/dog1.jpg'),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('name'),
                    Text('krism01@naver.com'),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.add),
              leading: Icon(Icons.home),
              onTap: () {
                print('clicked is home');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // TODO: drawer bar
        title: const Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0, // 그림자 높이
      ),
    );
  }
}
