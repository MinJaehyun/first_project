import 'package:first_project/16.random_dice/2/dice/dice.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('login page'),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
             child: const Icon(Icons.search),
          ),
        ],
      ),
      body: const DicePage(),
    );
  }
}
