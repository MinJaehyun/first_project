import 'package:first_project/main33/controller/cart_controller.dart';
import 'package:first_project/main33/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  ProductTile(this.product);
  final Product product;
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 75,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.fill,
                  ),
                ),
                Obx(
                  () => CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      icon: product.isFavorite.value
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border_rounded),
                      onPressed: () {
                        product.isFavorite.toggle();
                      },
                      iconSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis, // ellipsis: 줄임표
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating != null ? product.rating.toString() : '',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  cartController.addToCart(product);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(20, 20),
                ),
                child: Text('Add to cart'),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '\$${product.price}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ]),
      ),
    );
  }
}
