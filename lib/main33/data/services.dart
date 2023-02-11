import 'package:first_project/main33/model/product_model.dart';
import 'package:http/http.dart' as http;

class Services {
  // 4. api 호출하기
  static Future<List<Product>?> fetchData() async {
    String uri = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

    // var response = await http.get(Uri.parse(uri)); // 다른방법
    var response = await http.Client().get(Uri.parse(uri));

    if(response.statusCode == 200) {
      // 5. json 데이터를 어떻게 할건지 ?
      var jsonData = response.body;
      return productFromJson(jsonData);
    }
    return null;
  }
}