import 'package:http/http.dart' as http;
import 'dart:convert';

// note: 인자로 넘겨받은 url을 구문분석 및 디코드를 거쳐 객체를 반환하기 위한 메서드
class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    var response = await http.get(Uri.parse(url));
    var jsonDecodeData = jsonDecode(response.body);
    return jsonDecodeData;
  }
}