import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../views/Home/homepage.dart';

class WelcomeViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _token;

  BuildContext? context;

  Future<dynamic> login(String email, password) async {
    try {
      final body = {"email": email, "password": password};
      final response = await http.post(
          Uri.parse('http://14.161.18.75:5105/auth/login'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'accept': '*/*',
          });
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        print('Sucessfully');
        pageRoute(responseData['data']['token'], context as String);
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  void pageRoute(BuildContext context, String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    await Navigator.pushNamed(context, HomePage.id);
  }
}
