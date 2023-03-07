import 'package:first_project/main33/controller/cart_controller.dart';
import 'package:first_project/main33/controller/product_controller.dart';
import 'package:first_project/main33/view/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  bool _running = true;

  Future<String?> clock() async {
    while (_running) {
      await Future.delayed(Duration(milliseconds: 3000));
      DateTime _now = DateTime.now();
      print("${_now.hour}:${_now.minute}:${_now.second}");
      return "${_now.hour} : ${_now.minute} : ${_now.second}";
    }
    return null;
  }

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
            child: FutureBuilder(
                future: clock(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Obx(
                    () => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1, // 가로1, 세로2 == 0.5
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        // index 내려주고
                        return ProductTile(
                            productController.productList[index]);
                      },
                      itemCount: productController.productList.length,
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.redAccent,
        icon: Icon(Icons.shopping_cart),
        label: Obx(()=>(
          Text('Item: ${cartController.count}')
        ))
      ),
    );
  }
}
