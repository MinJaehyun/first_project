import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        body: Builder(builder: (context) {
          return Center(
            child: ButtonBar(children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('결제하셨습니다.')));
                    },
                    child: Text('결제하기'),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('결제 취소하기'),
                  ),
                ],
              ),
            ]),
          );
        }),
      ),
    );
  }
}
