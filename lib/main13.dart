import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _MyPageState();
}

class _MyPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: [
          PageViewModel(
              title: "1st page",
              body:
                  "Welcome to the app! This is a description of how it works.",
              image: const Center(
                child: Image(
                    image: AssetImage('assets/main13/image1.png'),
                    width: double.infinity),
              ),
              // Note: 기존 PageDecoration() 위젯을 커스텀하게 getPageDecoration 작성하여 사용(하단에 재사용)
              decoration: getPageDecoration()),
          PageViewModel(
              title: "2nd page",
              body:
                  "Instead of having to buy an entire share, invest any amount you want.",
              image: const Center(
                child: Image(
                    image: AssetImage('assets/main13/image2.png'),
                    width: double.infinity),
              ),
              decoration: const PageDecoration()),
          PageViewModel(
              title: "3rd page",
              body:
                  "Download the Stockpile app and master the market with our mini-lesson.",
              image: const Center(
                child: Image(
                    image: AssetImage('assets/main13/image3.png'),
                    width: double.infinity),
              ),
              decoration: getPageDecoration()),
          // PageViewModel(),
        ],
        done: const Text('done'),
        onDone: () {
          debugPrint('clicked is done');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyPage(),
              ));
        },
        next: const Icon(Icons.arrow_forward),
        skip: const Text('skip'),
        showSkipButton: true,
        dotsDecorator: DotsDecorator(
            color: Colors.cyan,
            size: Size(10, 10),
            activeSize: Size(22, 10),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            activeColor: Colors.red),
        curve: Curves.bounceInOut);
  }

  // NOTE: 커스텀하게 페이지에 PageDecoration 설정하기
  PageDecoration getPageDecoration() {
    return const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 18, color: Colors.blue),
        imagePadding: EdgeInsets.only(top: 40),
        pageColor: Colors.orange);
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Main Screen',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnBoardingPage(),
                      ));
                },
                child: const Text('Go to the on boarding Screen'))
          ],
        ),
      ),
    );
  }
}
