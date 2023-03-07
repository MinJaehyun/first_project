import 'package:first_project/main33/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartList = <Product>[].obs;
  int get count => cartList.length;

  void addToCart(Product product) {
    cartList.add(product);
  }
}