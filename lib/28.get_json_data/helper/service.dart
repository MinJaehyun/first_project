import 'package:first_project/28.get_json_data/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Service {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getInfo() async {
    try {
      // note: 구문 분석 후, http.get 사용하여 url 에 해당하는 json data(=response) 가져오기
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // note: userFromJson(str)
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        Fluttertoast.showToast(msg: "Error occurred. Please try again");
        return <User>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return <User>[];
    }
  }
}
