import 'package:first_project/main27/provider/fish_model.dart';
import 'package:first_project/main27/provider/meat_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'provider fish number is ${Provider.of<FishModel>(context).number}',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
            onPressed: () {
              Provider.of<FishModel>(context, listen: false).fishNumberPlus();
            },
            child: const Text('fish number plus', style: TextStyle(fontSize: 22),),
          ),
          const SizedBox(
            height: 55,
          ),
          Text(
            'provider meat number is ${Provider.of<MeatModel>(context).number}',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
            onPressed: () {
              Provider.of<MeatModel>(context, listen: false).meatNumberPlus();
            },
            child: const Text('meat number plus', style: TextStyle(fontSize: 22),),
          ),
        ],
      ),
    );
  }
}
