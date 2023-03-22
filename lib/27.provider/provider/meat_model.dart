import 'package:flutter/material.dart';

class MeatModel with ChangeNotifier{
  MeatModel({required this.number});
  late int number;

  void meatNumberPlus(){
    number++;
    notifyListeners();
  }
}