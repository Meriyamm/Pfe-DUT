import 'package:http/http.dart' as http;
import 'globals.dart';
import 'dart:convert';

class LoginServices {
  static Future<http.Response> login(String ip) async {
    Map data = {
      "ip": ip,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
