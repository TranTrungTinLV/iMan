import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Response? _response;

class Auth {
  Future<String?> login(User user) async {
    try {
      final body =
          json.encode({'email': user.email, 'password': user.password});
      final response = await http.post(
          Uri.parse('http://14.161.18.75:5105/auth/login'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'accept': '*/*',
          });
      if (response.statusCode == 200) {
        final responseData = await json.decode(response.body);
        final token = await responseData['token'] as String;
        print(response.body);
        print('Sucessfully');
        return token;
        // if (token != null) {
        //   final pref = await SharedPreferences.getInstance();
        //   await pref.setString('token', token);
        //   return token;
        // }
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
