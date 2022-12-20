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
              },
            ),
            ElevatedButton(
              child: Text('Go to the Third Page'),
              onPressed: () {
                // NOTE: popAndPushNamed 사용하여 widjet tree 에 쌓인 stack 을 바로 제거한다.
                Navigator.popAndPushNamed(context, '/thirdpage');
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
              },
            ),
            ElevatedButton(
              child: Text('Go to the Second Page'),
              onPressed: () {
                // NOTE: popAndPushNamed 사용하여 widjet tree 에 쌓인 stack 을 바로 제거한다.
                Navigator.popAndPushNamed(context, '/secondpage');
              },
            ),
          ],
        ),
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
 *
 * initialRoute, routes, mainAxis, crossAxis, Navigator.({ push, pop, popAndPushNamed }),
 * */
