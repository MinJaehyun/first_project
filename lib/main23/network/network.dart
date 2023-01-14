import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  String url;
  Network(this.url);
  dynamic jsonData;

  Future<dynamic> fetchData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
    return jsonData;
  }
}
