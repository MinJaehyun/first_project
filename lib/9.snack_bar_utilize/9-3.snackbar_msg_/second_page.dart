import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isHeart = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('상품 상세 페이지'),
        ),
        body: Builder(builder: (context) {
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(() => isHeart = !isHeart);
                      if (isHeart) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        // ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('좋아요 클릭하셨습니다.')));
                      }
                      if (!isHeart) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        // ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('좋아요 취소하셨습니다.'),
                          duration: Duration(seconds: 6),
                          action: SnackBarAction(
                              label: '취소한 이에게 알림을 보내겠습니까?',
                              onPressed: () {
                                setState(() {
                                  // 상대 id 를 가져와서, 취소되었다고 로그에 메시지 남김
                                });
                              }),
                        ));
                      }
                    },
                    icon: Icon(isHeart
                        ? Icons.heart_broken_rounded
                        : Icons.heart_broken_outlined),
                    label: Text('좋아요'),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('이 전 페이지로 돌아가기'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
