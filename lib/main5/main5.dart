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
  bool isOnDetailPressDrawer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('AppBar Icon Menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {
            debugPrint('shopping_cart btn is clicked');
          }, icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {
            debugPrint('shopping_cart btn is clicked');
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
                // note: 클릭 시, ListTile 삼항연산자 처리하여 보이면 true, 안 보이면 false 처리한다
                setState(() {
                  isOnDetailPressDrawer = !isOnDetailPressDrawer;
                });
              },
            ),

            if(isOnDetailPressDrawer)
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  trailing: const Icon(Icons.add),
                  onLongPress: () {
                    debugPrint('home');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('setting'),
                  trailing: const Icon(Icons.add),
                  onTap: () {
                    debugPrint('settings');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.question_answer),
                  title: const Text('question'),
                  trailing: const Icon(Icons.add),
                  onTap: () {
                    debugPrint('question');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// TODO, FIXME, NOTE
