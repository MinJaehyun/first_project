import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    var jsonDecodeData = jsonDecode(response.body);
    // print(jsonDecodeData['weather'][0]['main']);
    return jsonDecodeData;
  }
}