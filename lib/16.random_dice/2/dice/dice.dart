import 'package:first_project/16.random_dice/2/random_dice_page/random_dice_page.dart';
import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Image.asset('assets/main16/login.png'),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: "Enter 'dice'",
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Enter password",
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    // print('idController: $passwordController');
                    if (idController.text == 'dice' && passwordController.text == '123456') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RandomDicePage(),
                        ),
                      );
                    }
                    // else if(idController.text == 'dice' && passwordController.text != '123456') {}
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('err'),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    }
                  },
                  child: const Text('login btn'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
