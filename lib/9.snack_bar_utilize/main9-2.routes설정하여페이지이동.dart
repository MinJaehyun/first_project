import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '22',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const MyPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyPage(),
        '/secondpage': (context) => SecondPage(),
        '/thirdpage': (context) => ThirdPage(),
      },
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(Icons.account_circle)),
        centerTitle: true,
        title: Text('First Page'),
      ),
      body: Center(
        // 페이지 이동하는 버튼 만들기
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // NOTE: 박스 크기 동일하게 맞추기 위해 컨테이너 최대 크기 설정하고, 컬럼을 감싸서 가로에 stretch 설정함
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: Text('Go to the Second Page'),
                onPressed: () {
                  // Navigator.push 사용하여 Second Page 로 이동하기
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Second Page 로 이동 하셨습니다')),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Go to the Third Page'),
                onPressed: () {
                  // Navigator.push 사용하여 Second Page 로 이동하기
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Third Page 로 이동 하셨습니다')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Second Page'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('First Page 로 이동 하셨습니다')),
              );
            },
            icon: Icon(Icons.home)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to the First Page'),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('First Page 로 이동 하셨습니다')),
                );
              },
            ),
            ElevatedButton(
              child: Text('Go to the Third Page'),
              onPressed: () {
                // NOTE: popAndPushNamed 사용하여 widget tree 에 쌓인 stack 을 바로 제거한다.
                Navigator.popAndPushNamed(context, '/thirdpage');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Third Page 로 이동 하셨습니다')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Third Page'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('First Page 로 이동 하셨습니다')),
              );
            },
            icon: Icon(Icons.home)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Text('Go to the First Page',
                  style: TextStyle(letterSpacing: 1)),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('First Page 로 이동 하셨습니다')),
                );
              },
            ),
            ElevatedButton(
              child: Text('Go to the Second Page'),
              onPressed: () {
                // NOTE: popAndPushNamed 사용하여 widget tree 에 쌓인 stack 을 바로 제거한다.
                Navigator.popAndPushNamed(context, '/secondpage');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Second Page 로 이동 하셨습니다')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile Page'),
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.home)),
        ),
        body: Builder(builder: (context) {
          return Container(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'Name: JH',
                      style: TextStyle(
                          letterSpacing: 2.0, fontSize: 25, color: Colors.teal),
                    ),
                    SizedBox(height: 11),
                    Text('Age: 41',
                        style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 25,
                            color: Colors.teal)),
                    SizedBox(height: 11),
                    Text('LV: 2',
                        style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 25,
                            color: Colors.teal)),
                    SizedBox(height: 11),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('프로필 변경하기')),
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('프로필 변경을 취소하셨습니다.')));
                        },
                        child: Text('프로필 취소하기')),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

//
/**
 * 1. 두 박스 크기 동일하게 맞춤
 * 2. first page -> second page 또는 third page 로 이동하는 기능 구현
 * 3. second page -> third page 또는 third page -> second page 로 이동하는 기능 구현
 * 4. 상단 뒤로가기 버튼을 home 버튼으로 변경하여 first page 에 이동하도록 기능 구현
 * 5. 홈페이지에서 profile icon 을 누르면 페이지를 이동하여 프로필을 나타내며, 프로필을 취소하면 snack bar msg 를 띄우고,
 * 홈페이지 버튼을 누르면 즉시 snack bar msg 가 사라지도록,
 * 기존 Scaffold 를 return ScaffoldMessenger 으로 변경하고 body: Buiilder로 감싸서 적용.
 * initialRoute, routes, mainAxis, crossAxis, Navigator.({ push, pop, popAndPushNamed }),
 * */
