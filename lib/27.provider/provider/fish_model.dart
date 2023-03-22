import 'package:flutter/material.dart';

class FishModel with ChangeNotifier{
  FishModel({required this.number});
  late int number;

  void fishNumberPlus(){
    number += 1;
    notifyListeners();
  }
}