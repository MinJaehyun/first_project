import 'package:get/get.dart';
import '../models/product.dart';

// 모든 상품을 가져올 controller
class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // 임시 데이터
  void fetchData() {
    var productData = [
      Product(
        id: 1,
        title: 'Mouse',
        subTitle: 'some description about product',
        price: 33,
        time: DateTime.now().toString(),
      ),
      Product(
        id: 2,
        title: 'Keyboard',
        subTitle: 'some description about product',
        price: 44,
        time: DateTime.now().toString(),
      ),
      Product(
        id: 3,
        title: 'Monitor',
        subTitle: 'some description about product',
        price: 620,
        time: DateTime.now().toString(),
      ),
      Product(
        id: 4,
        title: 'Ram',
        subTitle: 'some description about product',
        price: 80,
        time: DateTime.now().toString(),
      ),
      Product(
        id: 5,
        title: 'Speaker',
        subTitle: 'some description about product',
        price: 120.5,
        time: DateTime.now().toString(),
      ),
    ];

    products.assignAll(productData);
  }
}
