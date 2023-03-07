import 'package:first_project/main32/models/product.dart';
import 'package:get/get.dart';

// 장바구니에 담긴 상품의 가격의 합을 구하는 controller
class CartController extends GetxController {
  var cartList = <Product>[].obs;
  double get totalPrice => cartList.fold(0, (e, item) => e + item.price);
  int get totalCartCount => cartList.length;

  void addToItem(Product product) {
    cartList.add(product);
  }
}