import 'package:flutter/cupertino.dart';
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
  bool isOnDetailPressBtn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0, // 그림자 높이
      ),

      // note: drawer - DrawerHeader
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.tealAccent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/dog1.jpg'),
                      radius: 30,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('name'),
                    Row(
                      children: [
                        const Text('krism01@naver.com'),
                        const SizedBox(width: 85),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isOnDetailPressBtn = !isOnDetailPressBtn;
                            });
                          },
                          // icon: isOnDetailPressBtn ? const Icon(Icons.arrow_downward) : const Icon(Icons.arrow_upward),
                          icon: Icon(isOnDetailPressBtn
                              ? CupertinoIcons.arrow_down
                              : CupertinoIcons.arrow_up),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (isOnDetailPressBtn)
              ListTile(
                title: const Text('Home'),
                trailing: const Icon(Icons.add),
                leading: const Icon(Icons.home),
                onTap: () {
                  debugPrint('clicked is home');
                },
              ),
          ],
        ),
      ),

      // note: endDrawer - UserAccountsDrawerHeader
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
                  debugPrint('arrow is clicked');
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  debugPrint('home');
                },
                trailing: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
