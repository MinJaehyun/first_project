import 'package:first_project/main33/data/services.dart';
import 'package:first_project/main33/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // 1. 앱 접근 시, 자동으로 api 호출하여 전체 목록 UI에 나타내기
    fetchData();
  }

  void fetchData() async {
    // 2. api 호출하는데 코드 길어지므로, 분리하기
    // 3. Service.메서드 가져오기
    var products = await Services.fetchData();
    if(products != null) {
      // productList.assignAll(products); // 방법 1.
      productList.value = products; // 방법 2.
    }
    print(productList);
  }
}