import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    var response = await http.get(Uri.parse(url));
    var jsonDecodeData = jsonDecode(response.body);
    return jsonDecodeData;
  }
}