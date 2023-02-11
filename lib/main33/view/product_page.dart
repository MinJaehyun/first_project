import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          elevation: 0,
          leading: Icon(Icons.menu),
          title: Text('shop'),
          actions: [
            Icon(Icons.transfer_within_a_station),
            SizedBox(width: 15),
            Icon(Icons.shopping_cart),
          ],
        ),
        body: Scrollbar(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2, // 가로1, 세로2 == 0.5
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.redAccent,
                    child: Text('index: $index', style: TextStyle(fontSize: 24, color: Colors.white),),
                  );
                },
                itemCount: 8,
              ),
            ),
          ),
        ));
  }
}
