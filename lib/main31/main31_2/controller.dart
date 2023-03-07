import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt _count1 = 1.obs;
  RxInt get count1 => _count1;

  void coutUpBtn() {
    _count1++;
    update();
  }

  void addSum() {
    var test = _count1;
  }
}
