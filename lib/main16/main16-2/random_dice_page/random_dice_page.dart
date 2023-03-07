import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

class RandomDicePage extends StatefulWidget {
  const RandomDicePage({Key? key}) : super(key: key);

  @override
  State<RandomDicePage> createState() => _RandomDicePageState();
}

class _RandomDicePageState extends State<RandomDicePage> {
  int ranNum1 = 1;
  int ranNum2 = 2;

  void shuffle() {
    int num1 = Random().nextInt(6) + 1;
    int num2 = Random().nextInt(6) + 1;
    setState(() {
      ranNum1 = num1;
      ranNum2 = num2;
    });
  }

  void showToast(int ranNum1,
      int ranNum2,) {
    Fluttertoast.showToast(
        msg: "Number is $ranNum1, $ranNum2",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white70,
        textColor: Colors.blueGrey,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice game'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Flexible(
                      flex: 5,
                      child:
                      Image.asset('assets/main16/dice/dice$ranNum1.png')),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 5,
                    child: Image.asset('assets/main16/dice/dice$ranNum2.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                // note: ★ ButtonTheme 더 이상 사용되지 않으므로, style 설정으로 처리한다
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(80, 50),
                ),
                onPressed: () {
                  // note: shuffle
                  shuffle();
                  // note: toast msg
                  showToast(ranNum1, ranNum2);
                },
                child: const Icon(Icons.play_arrow),
                // style: ButtonStyle(foregroundColor: ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
