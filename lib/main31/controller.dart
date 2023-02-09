import 'package:get/get.dart';

class Controller extends GetxController {
  late int _count = 0;
  int get count => _count;

  void inclementCount() {
    _count++;
    update();
  }
}