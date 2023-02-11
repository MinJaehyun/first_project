import 'package:first_project/main33/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text('shop'),
        actions: [
          Icon(Icons.view_list_rounded),
          SizedBox(width: 15),
          Icon(Icons.shopping_cart),
        ],
      ),
      body: Scrollbar(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Obx(
              () => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1, // 가로1, 세로2 == 0.5
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  // index 내려주고
                  return Text('test');
                },
                itemCount: productController.productList.length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
