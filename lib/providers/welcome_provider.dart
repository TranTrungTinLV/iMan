import 'package:flutter/material.dart';
import 'package:iman/core/services/welcom_services.dart';
import 'package:iman/views/Home/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/models/user.dart';

class User_Provider with ChangeNotifier {
  String? _token;
  late String email;
  String password = ' ';
  bool isButtonEnabled = false;
  void login(User user, context) async {
    try {
      final auth = Networking();
      final response = await auth.login(user);
      final token = response.token;
      if (token != null) {
        final pref = await SharedPreferences.getInstance();
        await pref.setString("login", token);
        print(token);
        Navigator.pushNamed(context, HomePage.id);
      } else {
        // handle null token
        print('Token not found in response');
      }
    } catch (e) {
      print(e);
    }
  }

  void pageRoute(BuildContext context, String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    Navigator.pushNamed(context, HomePage.id);
    notifyListeners();
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _token = pref.getString('login');
    notifyListeners();
    return _token;
  }

  void checkbutton(String password, String email) {
    isButtonEnabled = email.length >= 3 && password.length >= 3;
    notifyListeners();
  }
}
