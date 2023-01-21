import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  final String url2;
  Network(this.url2);

  Future<dynamic> fetchData() async {
    var url = Uri.parse(url2);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
