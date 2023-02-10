import 'package:first_project/main32/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_controller.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(12),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${controller.products[index].title}', style: TextStyle(fontSize: 24)),
                                    Text('\$${controller.products[index].price}', style: TextStyle(fontSize: 24)),
                                  ],
                                ),
                                Text('${controller.products[index].subTitle}'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${controller.products[index].time}'),
                                    ElevatedButton(
                                      onPressed: () {
                                        cartController.addToItem(controller.products[index]);
                                      },
                                      child: Text('Add to card'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              ),
            ),
            SizedBox(height: 30),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount: \$${controller.totalPrice}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                );
              }
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // todo: 장바구니에 추가한 상품 목록만 보여주기 - 새 페이지
        },
        backgroundColor: Colors.blueGrey,
        label: GetX<CartController>(
          builder: (controller) {
            return Text('${controller.totalCartCount}');
          }
        ),
        icon: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
